; ModuleID = '../data/hip_kernels/3007/154/main.cu'
source_filename = "../data/hip_kernels/3007/154/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9uplo_fremiiiPKfiiS0_iiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %21, %0
  %31 = icmp slt i32 %29, %0
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %142

33:                                               ; preds = %12
  %34 = icmp eq i32 %1, 132
  %35 = mul nsw i32 %21, %2
  %36 = mul nsw i32 %29, %2
  %37 = icmp sgt i32 %35, %36
  %38 = icmp sge i32 %35, %36
  %39 = select i1 %34, i1 %37, i1 %38
  br i1 %39, label %40, label %142

40:                                               ; preds = %33
  %41 = add nsw i32 %21, %4
  %42 = mul nsw i32 %29, %5
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %21, %7
  %48 = mul nsw i32 %29, %8
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = tail call float @llvm.fabs.f32(float %46)
  %54 = tail call float @llvm.fabs.f32(float %52)
  %55 = fcmp ogt float %53, %54
  br i1 %55, label %56, label %109

56:                                               ; preds = %40
  %57 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %53)
  %58 = tail call float @llvm.amdgcn.frexp.mant.f32(float %53)
  %59 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 12)
  %60 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %54)
  %61 = add nsw i32 %60, -1
  %62 = tail call float @llvm.amdgcn.frexp.mant.f32(float %54)
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 1)
  %64 = sub i32 %57, %60
  %65 = tail call float @llvm.amdgcn.rcp.f32(float %63)
  %66 = icmp sgt i32 %64, 12
  br i1 %66, label %67, label %80

67:                                               ; preds = %56, %67
  %68 = phi float [ %77, %67 ], [ %59, %56 ]
  %69 = phi i32 [ %78, %67 ], [ %64, %56 ]
  %70 = fmul float %65, %68
  %71 = tail call float @llvm.rint.f32(float %70)
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %72, float %63, float %68)
  %74 = fcmp olt float %73, 0.000000e+00
  %75 = select i1 %74, float %63, float -0.000000e+00
  %76 = fadd float %73, %75
  %77 = tail call float @llvm.amdgcn.ldexp.f32(float %76, i32 12)
  %78 = add nsw i32 %69, -12
  %79 = icmp ugt i32 %69, 24
  br i1 %79, label %67, label %80

80:                                               ; preds = %67, %56
  %81 = phi i32 [ %64, %56 ], [ %78, %67 ]
  %82 = phi float [ %59, %56 ], [ %77, %67 ]
  %83 = add nsw i32 %81, -11
  %84 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 %83)
  %85 = fmul float %65, %84
  %86 = tail call float @llvm.rint.f32(float %85)
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %87, float %63, float %84)
  %89 = fcmp olt float %88, 0.000000e+00
  %90 = select i1 %89, float %63, float -0.000000e+00
  %91 = fadd float %88, %90
  %92 = fptosi float %86 to i32
  %93 = fmul float %91, 2.000000e+00
  %94 = fcmp ogt float %93, %63
  %95 = and i32 %92, 1
  %96 = icmp ne i32 %95, 0
  %97 = xor i1 %89, %96
  %98 = fcmp oeq float %93, %63
  %99 = and i1 %97, %98
  %100 = or i1 %94, %99
  %101 = select i1 %100, float %63, float 0.000000e+00
  %102 = fsub float %91, %101
  %103 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 %61)
  %104 = bitcast float %46 to i32
  %105 = and i32 %104, -2147483648
  %106 = bitcast float %103 to i32
  %107 = xor i32 %105, %106
  %108 = bitcast i32 %107 to float
  br label %129

109:                                              ; preds = %40
  %110 = fcmp olt float %54, 0x47E0000000000000
  %111 = fmul float %53, 2.000000e+00
  %112 = fcmp ogt float %111, %54
  %113 = and i1 %110, %112
  %114 = fmul float %54, 5.000000e-01
  %115 = fcmp ogt float %53, %114
  %116 = or i1 %115, %113
  %117 = bitcast float %46 to i32
  %118 = bitcast float %52 to i32
  %119 = xor i32 %118, %117
  %120 = ashr i32 %119, 30
  %121 = or i32 %120, 1
  %122 = sitofp i32 %121 to float
  %123 = fneg float %122
  %124 = tail call float @llvm.fmuladd.f32(float %52, float %123, float %46)
  %125 = select i1 %116, float %124, float %46
  %126 = fcmp oeq float %53, %54
  %127 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %46)
  %128 = select i1 %126, float %127, float %125
  br label %129

129:                                              ; preds = %80, %109
  %130 = phi float [ %108, %80 ], [ %128, %109 ]
  %131 = fcmp oeq float %52, 0.000000e+00
  %132 = select i1 %131, float 0x7FF8000000000000, float %130
  %133 = fcmp ord float %52, 0.000000e+00
  %134 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 504)
  %135 = select i1 %133, i1 %134, i1 false
  %136 = select i1 %135, float %132, float 0x7FF8000000000000
  %137 = add nsw i32 %21, %10
  %138 = mul nsw i32 %29, %11
  %139 = add nsw i32 %137, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %9, i64 %140
  store float %136, float addrspace(1)* %141, align 4, !tbaa !7
  br label %142

142:                                              ; preds = %12, %129, %33
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
