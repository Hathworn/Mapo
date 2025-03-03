; ModuleID = '../data/hip_kernels/178/6/main.cu'
source_filename = "../data/hip_kernels/178/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23_weightRightkernel_cudaiifPfS_S_S_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add nuw nsw i32 %23, 1
  %25 = add i32 %24, %22
  %26 = icmp uge i32 %16, %0
  %27 = icmp eq i32 %25, 0
  %28 = select i1 %26, i1 true, i1 %27
  br i1 %28, label %121, label %29

29:                                               ; preds = %7
  %30 = add nsw i32 %1, -1
  %31 = icmp ult i32 %25, %30
  br i1 %31, label %32, label %121

32:                                               ; preds = %29
  %33 = mul i32 %16, %1
  %34 = add i32 %33, %25
  %35 = mul i32 %34, %1
  %36 = add i32 %35, %30
  %37 = add nsw i32 %36, -1
  %38 = add nsw i32 %36, %1
  %39 = sub nsw i32 %36, %1
  %40 = add nsw i32 %38, -1
  %41 = add nsw i32 %39, -1
  %42 = fmul contract float %2, 2.000000e+00
  %43 = sext i32 %36 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %45 = getelementptr inbounds float, float addrspace(1)* %6, i64 %43
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  %47 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %48 = fmul contract float %42, %47
  %49 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %50 = fadd contract float %49, %48
  store float %50, float addrspace(1)* %44, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %52 = fmul contract float %42, %51
  %53 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %54 = sext i32 %37 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = fadd contract float %53, %56
  %58 = fmul contract float %52, %57
  %59 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %60 = fsub contract float %59, %58
  store float %60, float addrspace(1)* %46, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fmul contract float %42, %62
  %64 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %65 = fadd contract float %64, %63
  store float %65, float addrspace(1)* %44, align 4, !tbaa !7
  %66 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %67 = fmul contract float %42, %66
  %68 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %69 = sext i32 %38 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %6, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = fadd contract float %68, %71
  %73 = fmul contract float %67, %72
  %74 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %75 = fsub contract float %74, %73
  store float %75, float addrspace(1)* %46, align 4, !tbaa !7
  %76 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = fmul contract float %42, %77
  %79 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %80 = fadd contract float %79, %78
  store float %80, float addrspace(1)* %44, align 4, !tbaa !7
  %81 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %82 = fmul contract float %42, %81
  %83 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %84 = sext i32 %39 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %6, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fadd contract float %83, %86
  %88 = fmul contract float %82, %87
  %89 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %90 = fsub contract float %89, %88
  store float %90, float addrspace(1)* %46, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 3
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %42, %92
  %94 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %95 = fadd contract float %94, %93
  store float %95, float addrspace(1)* %44, align 4, !tbaa !7
  %96 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %97 = fmul contract float %42, %96
  %98 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %99 = sext i32 %40 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %6, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fadd contract float %98, %101
  %103 = fmul contract float %97, %102
  %104 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %105 = fsub contract float %104, %103
  store float %105, float addrspace(1)* %46, align 4, !tbaa !7
  %106 = getelementptr inbounds float, float addrspace(1)* %5, i64 4
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fmul contract float %42, %107
  %109 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %110 = fadd contract float %109, %108
  store float %110, float addrspace(1)* %44, align 4, !tbaa !7
  %111 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %112 = fmul contract float %42, %111
  %113 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %114 = sext i32 %41 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %6, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fadd contract float %113, %116
  %118 = fmul contract float %112, %117
  %119 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %120 = fsub contract float %119, %118
  store float %120, float addrspace(1)* %46, align 4, !tbaa !7
  br label %121

121:                                              ; preds = %32, %7, %29
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
