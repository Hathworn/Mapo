; ModuleID = '../data/hip_kernels/2766/32/main.cu'
source_filename = "../data/hip_kernels/2766/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20cudaSGatherRP_kerneljjjjPKfPKiS2_S2_S2_S2_PfPijj(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture writeonly %10, i32 addrspace(1)* nocapture writeonly %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = mul i32 %15, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = and i32 %17, 31
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %19, %24
  %26 = add i32 %25, %18
  %27 = icmp ult i32 %26, %13
  br i1 %27, label %28, label %110

28:                                               ; preds = %14
  %29 = mul i32 %15, %13
  %30 = add i32 %26, %29
  %31 = add nsw i32 %26, %16
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = add nsw i32 %34, %16
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %36
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = mul i32 %40, %0
  %42 = add i32 %41, %38
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %36
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = add i32 %44, %2
  %46 = mul i32 %1, %0
  %47 = mul i32 %46, %45
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %36
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = mul i32 %46, 6
  %51 = mul i32 %50, %2
  %52 = mul i32 %51, %49
  %53 = add i32 %52, %42
  %54 = add i32 %53, %47
  %55 = shl i32 %2, 1
  %56 = add i32 %44, %55
  %57 = mul i32 %46, %56
  %58 = add i32 %53, %57
  %59 = mul i32 %2, 3
  %60 = add i32 %44, %59
  %61 = mul i32 %46, %60
  %62 = add i32 %53, %61
  %63 = shl i32 %2, 2
  %64 = add i32 %44, %63
  %65 = mul i32 %46, %64
  %66 = add i32 %53, %65
  %67 = sext i32 %34 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = shl nsw i32 %30, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %71
  store i32 %69, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7
  %77 = add nuw nsw i32 %70, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %78
  store i32 %76, i32 addrspace(1)* %79, align 4, !tbaa !7
  %80 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = add nuw nsw i32 %70, 2
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %85
  store i32 %83, i32 addrspace(1)* %86, align 4, !tbaa !7
  %87 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = add nuw nsw i32 %70, 3
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %92
  store i32 %90, i32 addrspace(1)* %93, align 4, !tbaa !7
  %94 = zext i32 %54 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %4, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !11, !amdgpu.noclobber !6
  %97 = getelementptr inbounds float, float addrspace(1)* %10, i64 %71
  store float %96, float addrspace(1)* %97, align 4, !tbaa !11
  %98 = zext i32 %58 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %4, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11
  %101 = getelementptr inbounds float, float addrspace(1)* %10, i64 %78
  store float %100, float addrspace(1)* %101, align 4, !tbaa !11
  %102 = zext i32 %62 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %4, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !11
  %105 = getelementptr inbounds float, float addrspace(1)* %10, i64 %85
  store float %104, float addrspace(1)* %105, align 4, !tbaa !11
  %106 = zext i32 %66 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %4, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !11
  %109 = getelementptr inbounds float, float addrspace(1)* %10, i64 %92
  store float %108, float addrspace(1)* %109, align 4, !tbaa !11
  br label %110

110:                                              ; preds = %28, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
