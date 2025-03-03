; ModuleID = '../data/hip_kernels/8588/6/main.cu'
source_filename = "../data/hip_kernels/8588/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ31totalWithThreadSyncAndSharedMemPfS_iE5sdata = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z31totalWithThreadSyncAndSharedMemPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = icmp slt i32 %4, %2
  br i1 %11, label %12, label %18

12:                                               ; preds = %3
  %13 = mul i32 %5, %10
  %14 = add i32 %13, %4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %18

18:                                               ; preds = %3, %12
  %19 = phi float [ %17, %12 ], [ 0.000000e+00, %3 ]
  %20 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ31totalWithThreadSyncAndSharedMemPfS_iE5sdata, i32 0, i32 %4
  store float %19, float addrspace(3)* %20, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ult i16 %9, 2
  br i1 %21, label %22, label %24

22:                                               ; preds = %34, %18
  %23 = icmp eq i32 %4, 0
  br i1 %23, label %36, label %40

24:                                               ; preds = %18, %34
  %25 = phi i32 [ %26, %34 ], [ %10, %18 ]
  %26 = lshr i32 %25, 1
  %27 = icmp ult i32 %4, %26
  br i1 %27, label %28, label %34

28:                                               ; preds = %24
  %29 = add nuw nsw i32 %26, %4
  %30 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ31totalWithThreadSyncAndSharedMemPfS_iE5sdata, i32 0, i32 %29
  %31 = load float, float addrspace(3)* %30, align 4, !tbaa !7
  %32 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %33 = fadd contract float %31, %32
  store float %33, float addrspace(3)* %20, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %28, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %25, 4
  br i1 %35, label %22, label %24, !llvm.loop !11

36:                                               ; preds = %22
  %37 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ31totalWithThreadSyncAndSharedMemPfS_iE5sdata, i32 0, i32 0), align 16, !tbaa !7
  %38 = zext i32 %5 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  store float %37, float addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %36, %22
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
