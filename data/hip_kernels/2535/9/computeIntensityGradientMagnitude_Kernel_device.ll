; ModuleID = '../data/hip_kernels/2535/9/main.cu'
source_filename = "../data/hip_kernels/2535/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z40computeIntensityGradientMagnitude_KernelPfPKfjj(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp ult i32 %13, %2
  %23 = icmp ult i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %132

25:                                               ; preds = %4
  %26 = mul i32 %21, %2
  %27 = add i32 %26, %13
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  store float 0xFFF0000000000000, float addrspace(1)* %29, align 4, !tbaa !7
  %30 = icmp eq i32 %13, 0
  br i1 %30, label %132, label %31

31:                                               ; preds = %25
  %32 = add i32 %2, -1
  %33 = icmp ult i32 %13, %32
  %34 = icmp ne i32 %21, 0
  %35 = select i1 %33, i1 %34, i1 false
  %36 = add i32 %3, -1
  %37 = icmp ult i32 %21, %36
  %38 = select i1 %35, i1 %37, i1 false
  br i1 %38, label %39, label %132

39:                                               ; preds = %31
  %40 = add i32 %21, -1
  %41 = mul i32 %40, %2
  %42 = add i32 %13, -1
  %43 = add i32 %41, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fcmp contract oeq float %46, 0xFFF0000000000000
  br i1 %47, label %132, label %48

48:                                               ; preds = %39
  %49 = add i32 %26, %42
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fcmp contract oeq float %52, 0xFFF0000000000000
  br i1 %53, label %132, label %54

54:                                               ; preds = %48
  %55 = add nuw i32 %21, 1
  %56 = mul i32 %55, %2
  %57 = add i32 %56, %42
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fcmp contract oeq float %60, 0xFFF0000000000000
  br i1 %61, label %132, label %62

62:                                               ; preds = %54
  %63 = add i32 %41, %13
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fcmp contract oeq float %66, 0xFFF0000000000000
  br i1 %67, label %132, label %68

68:                                               ; preds = %62
  %69 = add i32 %56, %13
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fcmp contract oeq float %72, 0xFFF0000000000000
  br i1 %73, label %132, label %74

74:                                               ; preds = %68
  %75 = add nuw i32 %13, 1
  %76 = add i32 %41, %75
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fcmp contract oeq float %79, 0xFFF0000000000000
  br i1 %80, label %132, label %81

81:                                               ; preds = %74
  %82 = add i32 %26, %75
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = fcmp contract oeq float %85, 0xFFF0000000000000
  br i1 %86, label %132, label %87

87:                                               ; preds = %81
  %88 = add i32 %56, %75
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fcmp contract oeq float %91, 0xFFF0000000000000
  br i1 %92, label %132, label %93

93:                                               ; preds = %87
  %94 = fsub contract float %79, %46
  %95 = fmul contract float %52, 2.000000e+00
  %96 = fsub contract float %94, %95
  %97 = fmul contract float %85, 2.000000e+00
  %98 = fadd contract float %96, %97
  %99 = fsub contract float %98, %60
  %100 = fadd contract float %99, %91
  %101 = fmul contract float %66, -2.000000e+00
  %102 = fsub contract float %101, %46
  %103 = fsub contract float %102, %79
  %104 = fadd contract float %60, %103
  %105 = fmul contract float %72, 2.000000e+00
  %106 = fadd contract float %105, %104
  %107 = fadd contract float %106, %91
  %108 = fmul contract float %100, %100
  %109 = fmul contract float %107, %107
  %110 = fadd contract float %108, %109
  %111 = fcmp olt float %110, 0x39F0000000000000
  %112 = select i1 %111, float 0x41F0000000000000, float 1.000000e+00
  %113 = fmul float %110, %112
  %114 = tail call float @llvm.sqrt.f32(float %113)
  %115 = bitcast float %114 to i32
  %116 = add nsw i32 %115, -1
  %117 = bitcast i32 %116 to float
  %118 = add nsw i32 %115, 1
  %119 = bitcast i32 %118 to float
  %120 = tail call i1 @llvm.amdgcn.class.f32(float %113, i32 608)
  %121 = select i1 %111, float 0x3EF0000000000000, float 1.000000e+00
  %122 = fneg float %119
  %123 = tail call float @llvm.fma.f32(float %122, float %114, float %113)
  %124 = fcmp ogt float %123, 0.000000e+00
  %125 = fneg float %117
  %126 = tail call float @llvm.fma.f32(float %125, float %114, float %113)
  %127 = fcmp ole float %126, 0.000000e+00
  %128 = select i1 %127, float %117, float %114
  %129 = select i1 %124, float %119, float %128
  %130 = fmul float %121, %129
  %131 = select i1 %120, float %113, float %130
  store float %131, float addrspace(1)* %29, align 4, !tbaa !7
  br label %132

132:                                              ; preds = %39, %54, %68, %81, %87, %93, %74, %62, %48, %4, %31, %25
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
