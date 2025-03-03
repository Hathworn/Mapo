; ModuleID = '../data/hip_kernels/6422/0/main.cu'
source_filename = "../data/hip_kernels/6422/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16check_collisionsffffPfS_S_S_PbPi(float %0, float %1, float %2, float %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i8 addrspace(1)* nocapture writeonly %8, i32 addrspace(1)* nocapture readnone %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %4, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = fcmp contract ugt float %14, %0
  br i1 %15, label %20, label %16

16:                                               ; preds = %10
  %17 = getelementptr inbounds float, float addrspace(1)* %6, i64 %12
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = fcmp contract ult float %18, %0
  br i1 %19, label %20, label %32

20:                                               ; preds = %16, %10
  %21 = fcmp contract ugt float %14, %2
  br i1 %21, label %26, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds float, float addrspace(1)* %6, i64 %12
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = fcmp contract ult float %24, %2
  br i1 %25, label %26, label %32

26:                                               ; preds = %22, %20
  %27 = fcmp contract ult float %14, %0
  br i1 %27, label %32, label %28

28:                                               ; preds = %26
  %29 = getelementptr inbounds float, float addrspace(1)* %6, i64 %12
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = fcmp contract ole float %30, %2
  br label %32

32:                                               ; preds = %26, %28, %22, %16
  %33 = phi i1 [ true, %22 ], [ true, %16 ], [ false, %26 ], [ %31, %28 ]
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %12
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fcmp contract ugt float %35, %1
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds float, float addrspace(1)* %7, i64 %12
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fcmp contract ult float %39, %1
  br i1 %40, label %41, label %53

41:                                               ; preds = %37, %32
  %42 = fcmp contract ugt float %35, %3
  br i1 %42, label %47, label %43

43:                                               ; preds = %41
  %44 = getelementptr inbounds float, float addrspace(1)* %7, i64 %12
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = fcmp contract ult float %45, %3
  br i1 %46, label %47, label %53

47:                                               ; preds = %43, %41
  %48 = fcmp contract ult float %35, %1
  br i1 %48, label %53, label %49

49:                                               ; preds = %47
  %50 = getelementptr inbounds float, float addrspace(1)* %7, i64 %12
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fcmp contract ole float %51, %3
  br label %53

53:                                               ; preds = %47, %49, %43, %37
  %54 = phi i1 [ true, %43 ], [ true, %37 ], [ false, %47 ], [ %52, %49 ]
  %55 = select i1 %33, i1 %54, i1 false
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %12
  %57 = zext i1 %55 to i8
  store i8 %57, i8 addrspace(1)* %56, align 1, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"bool", !7, i64 0}
