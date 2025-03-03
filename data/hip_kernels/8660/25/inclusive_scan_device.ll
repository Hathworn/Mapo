; ModuleID = '../data/hip_kernels/8660/25/main.cu'
source_filename = "../data/hip_kernels/8660/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14inclusive_scanPKjPj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !5
  %15 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %10
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = icmp ugt i16 %7, 1
  br i1 %16, label %20, label %17

17:                                               ; preds = %29, %2
  %18 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  store i32 %18, i32 addrspace(1)* %19, align 4, !tbaa !7
  ret void

20:                                               ; preds = %2, %29
  %21 = phi i32 [ %31, %29 ], [ 1, %2 ]
  %22 = phi i32 [ %30, %29 ], [ %14, %2 ]
  %23 = icmp ult i32 %10, %21
  br i1 %23, label %29, label %24

24:                                               ; preds = %20
  %25 = sub i32 %10, %21
  %26 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %25
  %27 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !7
  %28 = add i32 %27, %22
  br label %29

29:                                               ; preds = %24, %20
  %30 = phi i32 [ %28, %24 ], [ %22, %20 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 %30, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = shl i32 %21, 1
  %32 = icmp ult i32 %31, %8
  br i1 %32, label %20, label %17, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
