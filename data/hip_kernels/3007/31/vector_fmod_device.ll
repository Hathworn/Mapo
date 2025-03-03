; ModuleID = '../data/hip_kernels/3007/31/main.cu'
source_filename = "../data/hip_kernels/3007/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11vector_fmodiPKfiiS0_iiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %93

21:                                               ; preds = %10
  %22 = mul nsw i32 %19, %3
  %23 = add nsw i32 %22, %2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = mul nsw i32 %19, %6
  %28 = add nsw i32 %27, %5
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = tail call float @llvm.fabs.f32(float %26)
  %33 = tail call float @llvm.fabs.f32(float %31)
  %34 = fcmp ogt float %32, %33
  br i1 %34, label %35, label %77

35:                                               ; preds = %21
  %36 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %32)
  %37 = tail call float @llvm.amdgcn.frexp.mant.f32(float %32)
  %38 = tail call float @llvm.amdgcn.ldexp.f32(float %37, i32 12)
  %39 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %33)
  %40 = add nsw i32 %39, -1
  %41 = tail call float @llvm.amdgcn.frexp.mant.f32(float %33)
  %42 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 1)
  %43 = sub i32 %36, %39
  %44 = tail call float @llvm.amdgcn.rcp.f32(float %42)
  %45 = icmp sgt i32 %43, 12
  br i1 %45, label %46, label %59

46:                                               ; preds = %35, %46
  %47 = phi float [ %56, %46 ], [ %38, %35 ]
  %48 = phi i32 [ %57, %46 ], [ %43, %35 ]
  %49 = fmul float %44, %47
  %50 = tail call float @llvm.rint.f32(float %49)
  %51 = fneg float %50
  %52 = tail call float @llvm.fma.f32(float %51, float %42, float %47)
  %53 = fcmp olt float %52, 0.000000e+00
  %54 = select i1 %53, float %42, float -0.000000e+00
  %55 = fadd float %52, %54
  %56 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 12)
  %57 = add nsw i32 %48, -12
  %58 = icmp ugt i32 %48, 24
  br i1 %58, label %46, label %59

59:                                               ; preds = %46, %35
  %60 = phi i32 [ %43, %35 ], [ %57, %46 ]
  %61 = phi float [ %38, %35 ], [ %56, %46 ]
  %62 = add nsw i32 %60, -11
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %62)
  %64 = fmul float %44, %63
  %65 = tail call float @llvm.rint.f32(float %64)
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %66, float %42, float %63)
  %68 = fcmp olt float %67, 0.000000e+00
  %69 = select i1 %68, float %42, float -0.000000e+00
  %70 = fadd float %67, %69
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %70, i32 %40)
  %72 = bitcast float %26 to i32
  %73 = and i32 %72, -2147483648
  %74 = bitcast float %71 to i32
  %75 = xor i32 %73, %74
  %76 = bitcast i32 %75 to float
  br label %81

77:                                               ; preds = %21
  %78 = fcmp oeq float %32, %33
  %79 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %26)
  %80 = select i1 %78, float %79, float %26
  br label %81

81:                                               ; preds = %59, %77
  %82 = phi float [ %76, %59 ], [ %80, %77 ]
  %83 = fcmp oeq float %31, 0.000000e+00
  %84 = select i1 %83, float 0x7FF8000000000000, float %82
  %85 = fcmp ord float %31, 0.000000e+00
  %86 = tail call i1 @llvm.amdgcn.class.f32(float %26, i32 504)
  %87 = select i1 %85, i1 %86, i1 false
  %88 = select i1 %87, float %84, float 0x7FF8000000000000
  %89 = mul nsw i32 %19, %9
  %90 = add nsw i32 %89, %8
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %7, i64 %91
  store float %88, float addrspace(1)* %92, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %81, %10
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
