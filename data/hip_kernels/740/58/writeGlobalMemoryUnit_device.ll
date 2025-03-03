; ModuleID = '../data/hip_kernels/740/58/main.cu'
source_filename = "../data/hip_kernels/740/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z21writeGlobalMemoryUnitPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %88

14:                                               ; preds = %3
  %15 = shl nsw i32 %12, 9
  %16 = sitofp i32 %12 to float
  %17 = add nsw i32 %1, -1
  br label %18

18:                                               ; preds = %14, %18
  %19 = phi i32 [ %15, %14 ], [ %85, %18 ]
  %20 = phi i32 [ 0, %14 ], [ %86, %18 ]
  %21 = and i32 %19, %17
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  store float %16, float addrspace(1)* %23, align 4, !tbaa !7
  %24 = add nsw i32 %19, 1
  %25 = and i32 %24, %17
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float %16, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = add nsw i32 %19, 2
  %29 = and i32 %28, %17
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  store float %16, float addrspace(1)* %31, align 4, !tbaa !7
  %32 = add nsw i32 %19, 3
  %33 = and i32 %32, %17
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  store float %16, float addrspace(1)* %35, align 4, !tbaa !7
  %36 = add nsw i32 %19, 4
  %37 = and i32 %36, %17
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  store float %16, float addrspace(1)* %39, align 4, !tbaa !7
  %40 = add nsw i32 %19, 5
  %41 = and i32 %40, %17
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  store float %16, float addrspace(1)* %43, align 4, !tbaa !7
  %44 = add nsw i32 %19, 6
  %45 = and i32 %44, %17
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  store float %16, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = add nsw i32 %19, 7
  %49 = and i32 %48, %17
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %16, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = add nsw i32 %19, 8
  %53 = and i32 %52, %17
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  store float %16, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = add nsw i32 %19, 9
  %57 = and i32 %56, %17
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float %16, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = add nsw i32 %19, 10
  %61 = and i32 %60, %17
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  store float %16, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = add nsw i32 %19, 11
  %65 = and i32 %64, %17
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float %16, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = add nsw i32 %19, 12
  %69 = and i32 %68, %17
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  store float %16, float addrspace(1)* %71, align 4, !tbaa !7
  %72 = add nsw i32 %19, 13
  %73 = and i32 %72, %17
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  store float %16, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = add nsw i32 %19, 14
  %77 = and i32 %76, %17
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  store float %16, float addrspace(1)* %79, align 4, !tbaa !7
  %80 = add nsw i32 %19, 15
  %81 = and i32 %80, %17
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  store float %16, float addrspace(1)* %83, align 4, !tbaa !7
  %84 = add nsw i32 %19, 16
  %85 = and i32 %84, %17
  %86 = add nuw nsw i32 %20, 1
  %87 = icmp eq i32 %86, %2
  br i1 %87, label %88, label %18, !llvm.loop !11

88:                                               ; preds = %18, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
