; ModuleID = '../data/hip_kernels/721/61/main.cu'
source_filename = "../data/hip_kernels/721/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23GeometricBrownianMotionPffffP12hiprandStatej(float addrspace(1)* nocapture %0, float %1, float %2, float %3, %struct.hiprandState addrspace(1)* nocapture %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %5
  br i1 %16, label %17, label %135

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = fmul contract float %1, %3
  %22 = fcmp olt float %3, 0x39F0000000000000
  %23 = select i1 %22, float 0x41F0000000000000, float 1.000000e+00
  %24 = fmul float %23, %3
  %25 = tail call float @llvm.sqrt.f32(float %24)
  %26 = bitcast float %25 to i32
  %27 = add nsw i32 %26, -1
  %28 = bitcast i32 %27 to float
  %29 = add nsw i32 %26, 1
  %30 = bitcast i32 %29 to float
  %31 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 608)
  %32 = select i1 %22, float 0x3EF0000000000000, float 1.000000e+00
  %33 = fneg float %30
  %34 = tail call float @llvm.fma.f32(float %33, float %25, float %24)
  %35 = fcmp ogt float %34, 0.000000e+00
  %36 = fneg float %28
  %37 = tail call float @llvm.fma.f32(float %36, float %25, float %24)
  %38 = fcmp ole float %37, 0.000000e+00
  %39 = select i1 %38, float %28, float %25
  %40 = select i1 %35, float %30, float %39
  %41 = fmul float %32, %40
  %42 = select i1 %31, float %24, float %41
  %43 = fmul contract float %42, %2
  %44 = getelementptr %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 1
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !11
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %50, label %47

47:                                               ; preds = %17
  store i32 0, i32 addrspace(1)* %44, align 4, !tbaa !11
  %48 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 3
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !6
  br label %128

50:                                               ; preds = %17
  %51 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 5, i64 0
  %52 = load i32, i32 addrspace(1)* %51, align 8, !tbaa !17, !amdgpu.noclobber !6
  %53 = lshr i32 %52, 2
  %54 = xor i32 %53, %52
  %55 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 5, i64 1
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !17, !amdgpu.noclobber !6
  %57 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 5, i64 2
  %58 = load i32, i32 addrspace(1)* %57, align 8, !tbaa !17, !amdgpu.noclobber !6
  %59 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 5, i64 3
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !17, !amdgpu.noclobber !6
  %61 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 5, i64 4
  %62 = load i32, i32 addrspace(1)* %61, align 8, !tbaa !17, !amdgpu.noclobber !6
  %63 = shl i32 %62, 4
  %64 = shl i32 %54, 1
  %65 = xor i32 %64, %63
  %66 = xor i32 %65, %54
  %67 = xor i32 %66, %62
  %68 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 0
  %69 = load i32, i32 addrspace(1)* %68, align 8, !tbaa !18, !amdgpu.noclobber !6
  %70 = add i32 %69, 362437
  %71 = add i32 %70, %67
  %72 = lshr i32 %56, 2
  %73 = xor i32 %72, %56
  store i32 %58, i32 addrspace(1)* %51, align 8, !tbaa !17
  store i32 %60, i32 addrspace(1)* %55, align 4, !tbaa !17
  store i32 %62, i32 addrspace(1)* %57, align 8, !tbaa !17
  store i32 %67, i32 addrspace(1)* %59, align 4, !tbaa !17
  %74 = shl i32 %67, 4
  %75 = shl i32 %73, 1
  %76 = xor i32 %75, %74
  %77 = xor i32 %76, %73
  %78 = xor i32 %77, %67
  store i32 %78, i32 addrspace(1)* %61, align 8, !tbaa !17
  %79 = add i32 %69, 724874
  store i32 %79, i32 addrspace(1)* %68, align 8, !tbaa !18
  %80 = add i32 %78, %79
  %81 = uitofp i32 %71 to float
  %82 = fmul contract float %81, 0x3DF0000000000000
  %83 = fadd contract float %82, 0x3DF0000000000000
  %84 = uitofp i32 %80 to float
  %85 = fmul contract float %84, 0x3E1921FB60000000
  %86 = fadd contract float %85, 0x3E1921FB60000000
  %87 = tail call i1 @llvm.amdgcn.class.f32(float %83, i32 144)
  %88 = select i1 %87, float 0x41F0000000000000, float 1.000000e+00
  %89 = fmul float %83, %88
  %90 = tail call float @llvm.log2.f32(float %89)
  %91 = fmul float %90, 0x3FE62E42E0000000
  %92 = tail call i1 @llvm.amdgcn.class.f32(float %90, i32 519)
  %93 = fneg float %91
  %94 = tail call float @llvm.fma.f32(float %90, float 0x3FE62E42E0000000, float %93)
  %95 = tail call float @llvm.fma.f32(float %90, float 0x3E6EFA39E0000000, float %94)
  %96 = fadd float %91, %95
  %97 = select i1 %92, float %90, float %96
  %98 = select i1 %87, float 0x40362E4300000000, float 0.000000e+00
  %99 = fsub float %97, %98
  %100 = fmul contract float %99, -2.000000e+00
  %101 = fcmp olt float %100, 0x39F0000000000000
  %102 = select i1 %101, float 0x41F0000000000000, float 1.000000e+00
  %103 = fmul float %100, %102
  %104 = tail call float @llvm.sqrt.f32(float %103)
  %105 = bitcast float %104 to i32
  %106 = add nsw i32 %105, -1
  %107 = bitcast i32 %106 to float
  %108 = add nsw i32 %105, 1
  %109 = bitcast i32 %108 to float
  %110 = tail call i1 @llvm.amdgcn.class.f32(float %103, i32 608)
  %111 = select i1 %101, float 0x3EF0000000000000, float 1.000000e+00
  %112 = fneg float %109
  %113 = tail call float @llvm.fma.f32(float %112, float %104, float %103)
  %114 = fcmp ogt float %113, 0.000000e+00
  %115 = fneg float %107
  %116 = tail call float @llvm.fma.f32(float %115, float %104, float %103)
  %117 = fcmp ole float %116, 0.000000e+00
  %118 = select i1 %117, float %107, float %104
  %119 = select i1 %114, float %109, float %118
  %120 = fmul float %111, %119
  %121 = select i1 %110, float %103, float %120
  %122 = tail call float @llvm.sin.f32(float %86)
  %123 = tail call float @llvm.cos.f32(float %86)
  %124 = fmul contract float %122, %121
  %125 = fmul contract float %123, %121
  store i32 1, i32 addrspace(1)* %44, align 4, !tbaa !11
  %126 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %4, i64 %18, i32 0, i32 0, i32 3
  store float %125, float addrspace(1)* %126, align 4, !tbaa !16
  %127 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  br label %128

128:                                              ; preds = %47, %50
  %129 = phi float [ %20, %47 ], [ %127, %50 ]
  %130 = phi float [ %49, %47 ], [ %124, %50 ]
  %131 = fmul contract float %43, %130
  %132 = fadd contract float %21, %131
  %133 = fmul contract float %20, %132
  %134 = fadd contract float %129, %133
  store float %134, float addrspace(1)* %19, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %128, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sin.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.cos.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !14, i64 4}
!12 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !13, i64 0}
!13 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !14, i64 0, !14, i64 4, !14, i64 8, !8, i64 12, !15, i64 16, !9, i64 24}
!14 = !{!"int", !9, i64 0}
!15 = !{!"double", !9, i64 0}
!16 = !{!12, !8, i64 12}
!17 = !{!14, !14, i64 0}
!18 = !{!12, !14, i64 0}
