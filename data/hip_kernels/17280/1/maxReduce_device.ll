; ModuleID = '../data/hip_kernels/17280/1/main.cu'
source_filename = "../data/hip_kernels/17280/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9maxReducePiS_E5sdata = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9maxReducePiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ9maxReducePiS_E5sdata, i32 0, i32 %3
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %18

16:                                               ; preds = %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp eq i32 %3, 0
  br i1 %17, label %30, label %34

18:                                               ; preds = %2, %27
  %19 = phi i32 [ %9, %2 ], [ %28, %27 ]
  %20 = icmp ult i32 %3, %19
  br i1 %20, label %21, label %27

21:                                               ; preds = %18
  %22 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %23 = add nuw nsw i32 %19, %3
  %24 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ9maxReducePiS_E5sdata, i32 0, i32 %23
  %25 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !7
  %26 = tail call i32 @llvm.smax.i32(i32 %22, i32 %25)
  store i32 %26, i32 addrspace(3)* %15, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %18, %21
  %28 = lshr i32 %19, 1
  %29 = icmp ult i32 %19, 2
  br i1 %29, label %16, label %18, !llvm.loop !11

30:                                               ; preds = %16
  %31 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ9maxReducePiS_E5sdata, i32 0, i32 0), align 16, !tbaa !7
  %32 = zext i32 %4 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  store i32 %31, i32 addrspace(1)* %33, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %30, %16
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
