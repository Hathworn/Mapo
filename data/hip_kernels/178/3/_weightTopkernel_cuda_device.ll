; ModuleID = '../data/hip_kernels/178/3/main.cu'
source_filename = "../data/hip_kernels/178/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21_weightTopkernel_cudaiifPfS_S_S_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
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
  %24 = add i32 %22, %23
  %25 = add i32 %24, 1
  %26 = icmp ult i32 %16, %0
  %27 = icmp ne i32 %25, 0
  %28 = select i1 %26, i1 %27, i1 false
  %29 = add nsw i32 %1, -1
  %30 = icmp ult i32 %25, %29
  %31 = select i1 %28, i1 %30, i1 false
  br i1 %31, label %32, label %120

32:                                               ; preds = %7
  %33 = mul i32 %1, %1
  %34 = mul i32 %33, %16
  %35 = add i32 %25, %34
  %36 = add nsw i32 %35, 1
  %37 = add i32 %34, %24
  %38 = add nsw i32 %35, %1
  %39 = add nsw i32 %38, 1
  %40 = add nsw i32 %38, -1
  %41 = fmul contract float %2, 2.000000e+00
  %42 = sext i32 %35 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %42
  %44 = getelementptr inbounds float, float addrspace(1)* %6, i64 %42
  %45 = getelementptr inbounds float, float addrspace(1)* %4, i64 %42
  %46 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %47 = fmul contract float %41, %46
  %48 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %49 = fadd contract float %48, %47
  store float %49, float addrspace(1)* %43, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %51 = fmul contract float %41, %50
  %52 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %53 = sext i32 %36 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %6, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %52, %55
  %57 = fmul contract float %51, %56
  %58 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %59 = fsub contract float %58, %57
  store float %59, float addrspace(1)* %45, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fmul contract float %41, %61
  %63 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %64 = fadd contract float %63, %62
  store float %64, float addrspace(1)* %43, align 4, !tbaa !7
  %65 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %66 = fmul contract float %41, %65
  %67 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %68 = sext i32 %37 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %6, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fadd contract float %67, %70
  %72 = fmul contract float %66, %71
  %73 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %74 = fsub contract float %73, %72
  store float %74, float addrspace(1)* %45, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fmul contract float %41, %76
  %78 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %79 = fadd contract float %78, %77
  store float %79, float addrspace(1)* %43, align 4, !tbaa !7
  %80 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %81 = fmul contract float %41, %80
  %82 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %83 = sext i32 %38 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = fadd contract float %82, %85
  %87 = fmul contract float %81, %86
  %88 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %89 = fsub contract float %88, %87
  store float %89, float addrspace(1)* %45, align 4, !tbaa !7
  %90 = getelementptr inbounds float, float addrspace(1)* %5, i64 3
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fmul contract float %41, %91
  %93 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %94 = fadd contract float %93, %92
  store float %94, float addrspace(1)* %43, align 4, !tbaa !7
  %95 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %96 = fmul contract float %41, %95
  %97 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %98 = sext i32 %39 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %6, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fadd contract float %97, %100
  %102 = fmul contract float %96, %101
  %103 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %104 = fsub contract float %103, %102
  store float %104, float addrspace(1)* %45, align 4, !tbaa !7
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 4
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %41, %106
  %108 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %109 = fadd contract float %108, %107
  store float %109, float addrspace(1)* %43, align 4, !tbaa !7
  %110 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %111 = fmul contract float %41, %110
  %112 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %113 = sext i32 %40 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %6, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = fadd contract float %112, %115
  %117 = fmul contract float %111, %116
  %118 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %119 = fsub contract float %118, %117
  store float %119, float addrspace(1)* %45, align 4, !tbaa !7
  br label %120

120:                                              ; preds = %32, %7
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
