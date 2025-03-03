; ModuleID = '../data/hip_kernels/16947/0/main.cu'
source_filename = "../data/hip_kernels/16947/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5ameanPfS_E5sdata = internal unnamed_addr addrspace(3) global [4096 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5ameanPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = fptosi float %14 to i32
  %16 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ5ameanPfS_E5sdata, i32 0, i32 %3
  store i32 %15, i32 addrspace(3)* %16, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp ult i16 %8, 2
  br i1 %17, label %18, label %20

18:                                               ; preds = %30, %2
  %19 = icmp eq i32 %3, 0
  br i1 %19, label %32, label %37

20:                                               ; preds = %2, %30
  %21 = phi i32 [ %22, %30 ], [ %9, %2 ]
  %22 = lshr i32 %21, 1
  %23 = icmp ult i32 %3, %22
  br i1 %23, label %24, label %30

24:                                               ; preds = %20
  %25 = add nuw nsw i32 %22, %3
  %26 = getelementptr inbounds [4096 x i32], [4096 x i32] addrspace(3)* @_ZZ5ameanPfS_E5sdata, i32 0, i32 %25
  %27 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !11
  %28 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !11
  %29 = add nsw i32 %28, %27
  store i32 %29, i32 addrspace(3)* %16, align 4, !tbaa !11
  br label %30

30:                                               ; preds = %24, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i32 %21, 4
  br i1 %31, label %18, label %20, !llvm.loop !13

32:                                               ; preds = %18
  %33 = load i32, i32 addrspace(3)* getelementptr inbounds ([4096 x i32], [4096 x i32] addrspace(3)* @_ZZ5ameanPfS_E5sdata, i32 0, i32 0), align 16, !tbaa !11
  %34 = sitofp i32 %33 to float
  %35 = zext i32 %4 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  store float %34, float addrspace(1)* %36, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %32, %18
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
