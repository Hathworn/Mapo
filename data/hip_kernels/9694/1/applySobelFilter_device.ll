; ModuleID = '../data/hip_kernels/9694/1/main.cu'
source_filename = "../data/hip_kernels/9694/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16applySobelFilterPhS_Pfii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp sgt i32 %14, 0
  br i1 %23, label %24, label %152

24:                                               ; preds = %5
  %25 = add nuw nsw i32 %14, 1
  %26 = icmp slt i32 %25, %4
  %27 = icmp sgt i32 %22, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %152

29:                                               ; preds = %24
  %30 = add nuw nsw i32 %22, 1
  %31 = icmp slt i32 %30, %3
  br i1 %31, label %32, label %152

32:                                               ; preds = %29
  %33 = add nsw i32 %22, -1
  %34 = mul nsw i32 %33, %4
  %35 = add nsw i32 %14, -1
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !amdgpu.noclobber !5
  %40 = zext i8 %39 to i32
  %41 = add nsw i32 %34, %25
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = mul nsw i32 %22, %4
  %47 = add nsw i32 %46, %35
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !7, !amdgpu.noclobber !5
  %51 = zext i8 %50 to i32
  %52 = add nsw i32 %46, %25
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !5
  %56 = zext i8 %55 to i32
  %57 = mul nsw i32 %30, %4
  %58 = add nsw i32 %57, %35
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7, !amdgpu.noclobber !5
  %62 = zext i8 %61 to i32
  %63 = add nsw i32 %57, %25
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %64
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa !7, !amdgpu.noclobber !5
  %67 = zext i8 %66 to i32
  %68 = sub nsw i32 %51, %56
  %69 = shl nsw i32 %68, 1
  %70 = add nuw nsw i32 %40, %62
  %71 = add nuw nsw i32 %45, %67
  %72 = sub nsw i32 %70, %71
  %73 = add nsw i32 %72, %69
  %74 = add nsw i32 %34, %14
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7, !amdgpu.noclobber !5
  %78 = zext i8 %77 to i32
  %79 = shl nuw nsw i32 %78, 1
  %80 = add nuw nsw i32 %45, %40
  %81 = add nuw nsw i32 %80, %79
  %82 = add nsw i32 %57, %14
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !7, !amdgpu.noclobber !5
  %86 = zext i8 %85 to i32
  %87 = shl nuw nsw i32 %86, 1
  %88 = add nuw nsw i32 %67, %62
  %89 = add nuw nsw i32 %88, %87
  %90 = sub nsw i32 %81, %89
  %91 = sitofp i32 %73 to float
  %92 = fmul contract float %91, %91
  %93 = sitofp i32 %90 to float
  %94 = fmul contract float %93, %93
  %95 = fadd contract float %92, %94
  %96 = fcmp olt float %95, 0x39F0000000000000
  %97 = select i1 %96, float 0x41F0000000000000, float 1.000000e+00
  %98 = fmul float %95, %97
  %99 = tail call float @llvm.sqrt.f32(float %98)
  %100 = bitcast float %99 to i32
  %101 = add nsw i32 %100, -1
  %102 = bitcast i32 %101 to float
  %103 = add nsw i32 %100, 1
  %104 = bitcast i32 %103 to float
  %105 = tail call i1 @llvm.amdgcn.class.f32(float %98, i32 608)
  %106 = select i1 %96, float 0x3EF0000000000000, float 1.000000e+00
  %107 = fneg float %104
  %108 = tail call float @llvm.fma.f32(float %107, float %99, float %98)
  %109 = fcmp ogt float %108, 0.000000e+00
  %110 = fneg float %102
  %111 = tail call float @llvm.fma.f32(float %110, float %99, float %98)
  %112 = fcmp ole float %111, 0.000000e+00
  %113 = select i1 %112, float %102, float %99
  %114 = select i1 %109, float %104, float %113
  %115 = fmul float %106, %114
  %116 = select i1 %105, float %98, float %115
  %117 = fptoui float %116 to i8
  %118 = add nsw i32 %46, %14
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %119
  store i8 %117, i8 addrspace(1)* %120, align 1, !tbaa !7
  %121 = tail call float @llvm.fabs.f32(float %91)
  %122 = tail call float @llvm.fabs.f32(float %93)
  %123 = tail call float @llvm.minnum.f32(float %121, float %122)
  %124 = tail call float @llvm.maxnum.f32(float %121, float %122)
  %125 = fdiv float %123, %124, !fpmath !10
  %126 = fmul float %125, %125
  %127 = tail call float @llvm.fmuladd.f32(float %126, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %128 = tail call float @llvm.fmuladd.f32(float %126, float %127, float 0x3FA53F67E0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %126, float %128, float 0xBFB2FA9AE0000000)
  %130 = tail call float @llvm.fmuladd.f32(float %126, float %129, float 0x3FBB263640000000)
  %131 = tail call float @llvm.fmuladd.f32(float %126, float %130, float 0xBFC22C1CC0000000)
  %132 = tail call float @llvm.fmuladd.f32(float %126, float %131, float 0x3FC99717E0000000)
  %133 = tail call float @llvm.fmuladd.f32(float %126, float %132, float 0xBFD5554C40000000)
  %134 = fmul float %126, %133
  %135 = tail call float @llvm.fmuladd.f32(float %125, float %134, float %125)
  %136 = fsub float 0x3FF921FB60000000, %135
  %137 = fcmp ogt float %122, %121
  %138 = select i1 %137, float %136, float %135
  %139 = fsub float 0x400921FB60000000, %138
  %140 = icmp slt i32 %73, 0
  %141 = select i1 %140, float %139, float %138
  %142 = select i1 %140, float 0x400921FB60000000, float 0.000000e+00
  %143 = icmp eq i32 %81, %89
  %144 = select i1 %143, float %142, float %141
  %145 = select i1 %140, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %146 = fcmp oeq float %121, 0x7FF0000000000000
  %147 = fcmp oeq float %122, 0x7FF0000000000000
  %148 = and i1 %146, %147
  %149 = select i1 %148, float %145, float %144
  %150 = tail call float @llvm.copysign.f32(float %149, float %93)
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  store float %150, float addrspace(1)* %151, align 4, !tbaa !11
  br label %152

152:                                              ; preds = %32, %29, %24, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{float 2.500000e+00}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !8, i64 0}
