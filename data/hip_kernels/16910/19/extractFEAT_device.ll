; ModuleID = '../data/hip_kernels/16910/19/main.cu'
source_filename = "../data/hip_kernels/16910/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11extractFEATPKdPKiS2_S2_PKfS2_S4_Pf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %13 = fptosi double %12 to i32
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 5
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !5, !amdgpu.noclobber !9
  %16 = fptosi double %15 to i32
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !10, !invariant.load !9
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !11
  %25 = mul i32 %11, %21
  %26 = udiv i32 %24, %21
  %27 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !5, !amdgpu.noclobber !9
  %29 = fptrunc double %28 to float
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 1
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !20, !amdgpu.noclobber !9
  %32 = add i32 %25, %9
  %33 = add i32 %32, %31
  %34 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !20, !amdgpu.noclobber !9
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %131

36:                                               ; preds = %8
  %37 = mul i32 %26, %21
  %38 = icmp ugt i32 %24, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %26, %39
  %41 = mul nsw i32 %40, %21
  br label %42

42:                                               ; preds = %36, %42
  %43 = phi i32 [ %33, %36 ], [ %129, %42 ]
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !20, !amdgpu.noclobber !9
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !20, !amdgpu.noclobber !9
  %49 = mul nsw i32 %48, %16
  %50 = add nsw i32 %49, %10
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !20, !amdgpu.noclobber !9
  %54 = mul nsw i32 %53, %13
  %55 = add i32 %54, %46
  %56 = sext i32 %53 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !22
  %59 = fdiv contract float %29, %58
  %60 = fmul contract float %58, %58
  %61 = fdiv contract float %29, %60
  %62 = fadd contract float %61, 1.000000e+00
  %63 = fcmp olt float %62, 0x39F0000000000000
  %64 = select i1 %63, float 0x41F0000000000000, float 1.000000e+00
  %65 = fmul float %62, %64
  %66 = tail call float @llvm.sqrt.f32(float %65)
  %67 = bitcast float %66 to i32
  %68 = add nsw i32 %67, -1
  %69 = bitcast i32 %68 to float
  %70 = add nsw i32 %67, 1
  %71 = bitcast i32 %70 to float
  %72 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 608)
  %73 = select i1 %63, float 0x3EF0000000000000, float 1.000000e+00
  %74 = fneg float %71
  %75 = tail call float @llvm.fma.f32(float %74, float %66, float %65)
  %76 = fcmp ogt float %75, 0.000000e+00
  %77 = fneg float %69
  %78 = tail call float @llvm.fma.f32(float %77, float %66, float %65)
  %79 = fcmp ole float %78, 0.000000e+00
  %80 = select i1 %79, float %69, float %66
  %81 = select i1 %76, float %71, float %80
  %82 = fmul float %73, %81
  %83 = select i1 %72, float %65, float %82
  %84 = add i32 %55, -3
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !22
  %88 = fadd contract float %87, %59
  %89 = fdiv contract float %88, %83
  %90 = tail call float @llvm.maxnum.f32(float %89, float 0.000000e+00)
  %91 = add i32 %55, -2
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %4, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !22
  %95 = fadd contract float %94, %59
  %96 = fdiv contract float %95, %83
  %97 = tail call float @llvm.maxnum.f32(float %90, float %96)
  %98 = add i32 %55, -1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %4, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !22
  %102 = fadd contract float %101, %59
  %103 = fdiv contract float %102, %83
  %104 = tail call float @llvm.maxnum.f32(float %97, float %103)
  %105 = sext i32 %55 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %4, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !22
  %108 = fadd contract float %107, %59
  %109 = fdiv contract float %108, %83
  %110 = tail call float @llvm.maxnum.f32(float %104, float %109)
  %111 = add i32 %55, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %4, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !22
  %115 = fadd contract float %114, %59
  %116 = fdiv contract float %115, %83
  %117 = tail call float @llvm.maxnum.f32(float %110, float %116)
  %118 = add i32 %55, 2
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %4, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !22
  %122 = fadd contract float %121, %59
  %123 = fdiv contract float %122, %83
  %124 = tail call float @llvm.maxnum.f32(float %117, float %123)
  %125 = mul nsw i32 %43, %16
  %126 = add nsw i32 %125, %10
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %7, i64 %127
  store float %124, float addrspace(1)* %128, align 4, !tbaa !22
  %129 = add nsw i32 %43, %41
  %130 = icmp slt i32 %129, %34
  br i1 %130, label %42, label %131, !llvm.loop !24

131:                                              ; preds = %42, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !7, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !7, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
