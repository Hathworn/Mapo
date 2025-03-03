; ModuleID = '../data/hip_kernels/3007/93/main.cu'
source_filename = "../data/hip_kernels/3007/93/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7ge_fremiiPKfiiS0_iiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %0
  %30 = icmp slt i32 %28, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %134

32:                                               ; preds = %11
  %33 = add nsw i32 %20, %3
  %34 = mul nsw i32 %28, %4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %20, %6
  %40 = mul nsw i32 %28, %7
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = tail call float @llvm.fabs.f32(float %38)
  %46 = tail call float @llvm.fabs.f32(float %44)
  %47 = fcmp ogt float %45, %46
  br i1 %47, label %48, label %101

48:                                               ; preds = %32
  %49 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %45)
  %50 = tail call float @llvm.amdgcn.frexp.mant.f32(float %45)
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 12)
  %52 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %46)
  %53 = add nsw i32 %52, -1
  %54 = tail call float @llvm.amdgcn.frexp.mant.f32(float %46)
  %55 = tail call float @llvm.amdgcn.ldexp.f32(float %54, i32 1)
  %56 = sub i32 %49, %52
  %57 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %58 = icmp sgt i32 %56, 12
  br i1 %58, label %59, label %72

59:                                               ; preds = %48, %59
  %60 = phi float [ %69, %59 ], [ %51, %48 ]
  %61 = phi i32 [ %70, %59 ], [ %56, %48 ]
  %62 = fmul float %57, %60
  %63 = tail call float @llvm.rint.f32(float %62)
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %64, float %55, float %60)
  %66 = fcmp olt float %65, 0.000000e+00
  %67 = select i1 %66, float %55, float -0.000000e+00
  %68 = fadd float %65, %67
  %69 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 12)
  %70 = add nsw i32 %61, -12
  %71 = icmp ugt i32 %61, 24
  br i1 %71, label %59, label %72

72:                                               ; preds = %59, %48
  %73 = phi i32 [ %56, %48 ], [ %70, %59 ]
  %74 = phi float [ %51, %48 ], [ %69, %59 ]
  %75 = add nsw i32 %73, -11
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 %75)
  %77 = fmul float %57, %76
  %78 = tail call float @llvm.rint.f32(float %77)
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %79, float %55, float %76)
  %81 = fcmp olt float %80, 0.000000e+00
  %82 = select i1 %81, float %55, float -0.000000e+00
  %83 = fadd float %80, %82
  %84 = fptosi float %78 to i32
  %85 = fmul float %83, 2.000000e+00
  %86 = fcmp ogt float %85, %55
  %87 = and i32 %84, 1
  %88 = icmp ne i32 %87, 0
  %89 = xor i1 %81, %88
  %90 = fcmp oeq float %85, %55
  %91 = and i1 %89, %90
  %92 = or i1 %86, %91
  %93 = select i1 %92, float %55, float 0.000000e+00
  %94 = fsub float %83, %93
  %95 = tail call float @llvm.amdgcn.ldexp.f32(float %94, i32 %53)
  %96 = bitcast float %38 to i32
  %97 = and i32 %96, -2147483648
  %98 = bitcast float %95 to i32
  %99 = xor i32 %97, %98
  %100 = bitcast i32 %99 to float
  br label %121

101:                                              ; preds = %32
  %102 = fcmp olt float %46, 0x47E0000000000000
  %103 = fmul float %45, 2.000000e+00
  %104 = fcmp ogt float %103, %46
  %105 = and i1 %102, %104
  %106 = fmul float %46, 5.000000e-01
  %107 = fcmp ogt float %45, %106
  %108 = or i1 %107, %105
  %109 = bitcast float %38 to i32
  %110 = bitcast float %44 to i32
  %111 = xor i32 %110, %109
  %112 = ashr i32 %111, 30
  %113 = or i32 %112, 1
  %114 = sitofp i32 %113 to float
  %115 = fneg float %114
  %116 = tail call float @llvm.fmuladd.f32(float %44, float %115, float %38)
  %117 = select i1 %108, float %116, float %38
  %118 = fcmp oeq float %45, %46
  %119 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %38)
  %120 = select i1 %118, float %119, float %117
  br label %121

121:                                              ; preds = %72, %101
  %122 = phi float [ %100, %72 ], [ %120, %101 ]
  %123 = fcmp oeq float %44, 0.000000e+00
  %124 = select i1 %123, float 0x7FF8000000000000, float %122
  %125 = fcmp ord float %44, 0.000000e+00
  %126 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 504)
  %127 = select i1 %125, i1 %126, i1 false
  %128 = select i1 %127, float %124, float 0x7FF8000000000000
  %129 = add nsw i32 %20, %9
  %130 = mul nsw i32 %28, %10
  %131 = add nsw i32 %129, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %8, i64 %132
  store float %128, float addrspace(1)* %133, align 4, !tbaa !7
  br label %134

134:                                              ; preds = %121, %11
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
