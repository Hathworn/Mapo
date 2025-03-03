; ModuleID = '../data/hip_kernels/642/16/main.cu'
source_filename = "../data/hip_kernels/642/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_incScan = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17incSumScan_kernelPjS_m(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = zext i32 %12 to i64
  %14 = icmp ult i64 %13, %2
  br i1 %14, label %15, label %36

15:                                               ; preds = %3
  %16 = zext i32 %4 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_incScan, i32 0, i32 %4
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %23

20:                                               ; preds = %32
  %21 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  store i32 %21, i32 addrspace(1)* %22, align 4, !tbaa !7
  br label %36

23:                                               ; preds = %15, %32
  %24 = phi i32 [ %33, %32 ], [ 1, %15 ]
  %25 = icmp ult i32 %4, %24
  br i1 %25, label %32, label %26

26:                                               ; preds = %23
  %27 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !7
  %28 = sub i32 %4, %24
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_incScan, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = add i32 %30, %27
  store i32 %31, i32 addrspace(3)* %19, align 4, !tbaa !7
  br label %32

32:                                               ; preds = %26, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = shl nsw i32 %24, 1
  %34 = zext i32 %33 to i64
  %35 = icmp ugt i64 %34, %2
  br i1 %35, label %20, label %23, !llvm.loop !11

36:                                               ; preds = %3, %20
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
