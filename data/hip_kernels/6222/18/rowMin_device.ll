; ModuleID = '../data/hip_kernels/6222/18/main.cu'
source_filename = "../data/hip_kernels/6222/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6rowMinPfPimm(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3) local_unnamed_addr #1 {
  %5 = alloca [10000 x [2 x float]], align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %15, %3
  br i1 %16, label %17, label %79

17:                                               ; preds = %4
  %18 = bitcast [10000 x [2 x float]] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 80000, i8 addrspace(5)* %18) #3
  %19 = mul i64 %15, %2
  %20 = icmp eq i64 %2, 0
  br i1 %20, label %67, label %22

21:                                               ; preds = %22
  br i1 %20, label %67, label %35

22:                                               ; preds = %17, %22
  %23 = phi i64 [ %32, %22 ], [ 0, %17 ]
  %24 = trunc i64 %23 to i32
  %25 = add i64 %23, %19
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %24, i32 0
  store float %27, float addrspace(5)* %28, align 8, !tbaa !7
  %29 = sitofp i32 %24 to float
  %30 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %24, i32 1
  store float %29, float addrspace(5)* %30, align 4, !tbaa !7
  %31 = add nuw nsw i64 %23, 1
  %32 = and i64 %31, 4294967295
  %33 = icmp ult i64 %32, %2
  br i1 %33, label %22, label %21, !llvm.loop !11

34:                                               ; preds = %44
  br i1 %20, label %67, label %68

35:                                               ; preds = %21, %44
  %36 = phi i32 [ %52, %44 ], [ 0, %21 ]
  %37 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %36, i32 0
  %38 = load float, float addrspace(5)* %37, align 8, !tbaa !7
  %39 = zext i32 %36 to i64
  %40 = icmp ult i64 %39, %2
  br i1 %40, label %55, label %44

41:                                               ; preds = %55
  %42 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %63, i32 0
  %43 = load float, float addrspace(5)* %42, align 8, !tbaa !7
  br label %44

44:                                               ; preds = %41, %35
  %45 = phi float [ %38, %35 ], [ %43, %41 ]
  %46 = phi i32 [ %36, %35 ], [ %63, %41 ]
  %47 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %36, i32 1
  %48 = load float, float addrspace(5)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %46, i32 0
  store float %45, float addrspace(5)* %37, align 8, !tbaa !7
  %50 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %46, i32 1
  %51 = load float, float addrspace(5)* %50, align 4, !tbaa !7
  store float %51, float addrspace(5)* %47, align 4, !tbaa !7
  store float %38, float addrspace(5)* %49, align 8, !tbaa !7
  store float %48, float addrspace(5)* %50, align 4, !tbaa !7
  %52 = add nuw nsw i32 %36, 1
  %53 = zext i32 %52 to i64
  %54 = icmp ult i64 %53, %2
  br i1 %54, label %35, label %34, !llvm.loop !13

55:                                               ; preds = %35, %55
  %56 = phi i32 [ %64, %55 ], [ %36, %35 ]
  %57 = phi i32 [ %63, %55 ], [ %36, %35 ]
  %58 = phi float [ %62, %55 ], [ %38, %35 ]
  %59 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %56, i32 0
  %60 = load float, float addrspace(5)* %59, align 8, !tbaa !7
  %61 = fcmp contract ogt float %60, %58
  %62 = select i1 %61, float %60, float %58
  %63 = select i1 %61, i32 %56, i32 %57
  %64 = add nuw nsw i32 %56, 1
  %65 = zext i32 %64 to i64
  %66 = icmp ult i64 %65, %2
  br i1 %66, label %55, label %41, !llvm.loop !14

67:                                               ; preds = %68, %17, %21, %34
  call void @llvm.lifetime.end.p5i8(i64 80000, i8 addrspace(5)* %18) #3
  br label %79

68:                                               ; preds = %34, %68
  %69 = phi i64 [ %77, %68 ], [ 0, %34 ]
  %70 = trunc i64 %69 to i32
  %71 = getelementptr inbounds [10000 x [2 x float]], [10000 x [2 x float]] addrspace(5)* %5, i32 0, i32 %70, i32 1
  %72 = load float, float addrspace(5)* %71, align 4, !tbaa !7
  %73 = fptosi float %72 to i32
  %74 = add i64 %69, %19
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %74
  store i32 %73, i32 addrspace(1)* %75, align 4, !tbaa !15
  %76 = add nuw nsw i64 %69, 1
  %77 = and i64 %76, 4294967295
  %78 = icmp ult i64 %77, %2
  br i1 %78, label %68, label %67, !llvm.loop !17

79:                                               ; preds = %67, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
!17 = distinct !{!17, !12}
