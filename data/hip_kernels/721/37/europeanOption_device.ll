; ModuleID = '../data/hip_kernels/721/37/main.cu'
source_filename = "../data/hip_kernels/721/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14europeanOptioniiPfffP12hiprandState(i32 %0, i32 %1, float addrspace(1)* nocapture writeonly %2, float %3, float %4, %struct.hiprandState addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %122

17:                                               ; preds = %6
  %18 = icmp sgt i32 %1, 0
  %19 = sext i32 %15 to i64
  br i1 %18, label %20, label %30

20:                                               ; preds = %17
  %21 = getelementptr %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 1
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 3
  %23 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 5, i64 0
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 5, i64 1
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 5, i64 2
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 5, i64 3
  %27 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 5, i64 4
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %5, i64 %19, i32 0, i32 0, i32 0
  %29 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %35

30:                                               ; preds = %112, %17
  %31 = phi float [ %3, %17 ], [ %118, %112 ]
  %32 = fsub contract float %31, %4
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %19
  store float %32, float addrspace(1)* %33, align 4, !tbaa !15
  %34 = fcmp contract olt float %32, 0.000000e+00
  br i1 %34, label %121, label %122

35:                                               ; preds = %20, %112
  %36 = phi i32 [ %29, %20 ], [ %113, %112 ]
  %37 = phi i32 [ 0, %20 ], [ %119, %112 ]
  %38 = phi float [ %3, %20 ], [ %118, %112 ]
  %39 = icmp eq i32 %36, 0
  br i1 %39, label %42, label %40

40:                                               ; preds = %35
  store i32 0, i32 addrspace(1)* %21, align 4, !tbaa !7
  %41 = load float, float addrspace(1)* %22, align 4, !tbaa !16
  br label %112

42:                                               ; preds = %35
  %43 = load i32, i32 addrspace(1)* %23, align 8, !tbaa !17
  %44 = lshr i32 %43, 2
  %45 = xor i32 %44, %43
  %46 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !17
  %47 = load i32, i32 addrspace(1)* %25, align 8, !tbaa !17
  %48 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !17
  %49 = load i32, i32 addrspace(1)* %27, align 8, !tbaa !17
  %50 = shl i32 %49, 4
  %51 = shl i32 %45, 1
  %52 = xor i32 %51, %50
  %53 = xor i32 %52, %45
  %54 = xor i32 %53, %49
  %55 = load i32, i32 addrspace(1)* %28, align 8, !tbaa !18
  %56 = add i32 %55, 362437
  %57 = add i32 %56, %54
  %58 = lshr i32 %46, 2
  %59 = xor i32 %58, %46
  store i32 %47, i32 addrspace(1)* %23, align 8, !tbaa !17
  store i32 %48, i32 addrspace(1)* %24, align 4, !tbaa !17
  store i32 %49, i32 addrspace(1)* %25, align 8, !tbaa !17
  store i32 %54, i32 addrspace(1)* %26, align 4, !tbaa !17
  %60 = shl i32 %54, 4
  %61 = shl i32 %59, 1
  %62 = xor i32 %61, %60
  %63 = xor i32 %62, %59
  %64 = xor i32 %63, %54
  store i32 %64, i32 addrspace(1)* %27, align 8, !tbaa !17
  %65 = add i32 %55, 724874
  store i32 %65, i32 addrspace(1)* %28, align 8, !tbaa !18
  %66 = add i32 %64, %65
  %67 = uitofp i32 %57 to float
  %68 = fmul contract float %67, 0x3DF0000000000000
  %69 = fadd contract float %68, 0x3DF0000000000000
  %70 = uitofp i32 %66 to float
  %71 = fmul contract float %70, 0x3E1921FB60000000
  %72 = fadd contract float %71, 0x3E1921FB60000000
  %73 = tail call i1 @llvm.amdgcn.class.f32(float %69, i32 144)
  %74 = select i1 %73, float 0x41F0000000000000, float 1.000000e+00
  %75 = fmul float %69, %74
  %76 = tail call float @llvm.log2.f32(float %75)
  %77 = fmul float %76, 0x3FE62E42E0000000
  %78 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 519)
  %79 = fneg float %77
  %80 = tail call float @llvm.fma.f32(float %76, float 0x3FE62E42E0000000, float %79)
  %81 = tail call float @llvm.fma.f32(float %76, float 0x3E6EFA39E0000000, float %80)
  %82 = fadd float %77, %81
  %83 = select i1 %78, float %76, float %82
  %84 = select i1 %73, float 0x40362E4300000000, float 0.000000e+00
  %85 = fsub float %83, %84
  %86 = fmul contract float %85, -2.000000e+00
  %87 = fcmp olt float %86, 0x39F0000000000000
  %88 = select i1 %87, float 0x41F0000000000000, float 1.000000e+00
  %89 = fmul float %86, %88
  %90 = tail call float @llvm.sqrt.f32(float %89)
  %91 = bitcast float %90 to i32
  %92 = add nsw i32 %91, -1
  %93 = bitcast i32 %92 to float
  %94 = add nsw i32 %91, 1
  %95 = bitcast i32 %94 to float
  %96 = tail call i1 @llvm.amdgcn.class.f32(float %89, i32 608)
  %97 = select i1 %87, float 0x3EF0000000000000, float 1.000000e+00
  %98 = fneg float %95
  %99 = tail call float @llvm.fma.f32(float %98, float %90, float %89)
  %100 = fcmp ogt float %99, 0.000000e+00
  %101 = fneg float %93
  %102 = tail call float @llvm.fma.f32(float %101, float %90, float %89)
  %103 = fcmp ole float %102, 0.000000e+00
  %104 = select i1 %103, float %93, float %90
  %105 = select i1 %100, float %95, float %104
  %106 = fmul float %97, %105
  %107 = select i1 %96, float %89, float %106
  %108 = tail call float @llvm.sin.f32(float %72)
  %109 = tail call float @llvm.cos.f32(float %72)
  %110 = fmul contract float %108, %107
  %111 = fmul contract float %109, %107
  store i32 1, i32 addrspace(1)* %21, align 4, !tbaa !7
  store float %111, float addrspace(1)* %22, align 4, !tbaa !16
  br label %112

112:                                              ; preds = %40, %42
  %113 = phi i32 [ 0, %40 ], [ 1, %42 ]
  %114 = phi float [ %41, %40 ], [ %110, %42 ]
  %115 = fmul contract float %114, 0x3FC99999A0000000
  %116 = fdiv contract float %115, 0x402FBFBF80000000
  %117 = fadd contract float %116, 0x3FF000D000000000
  %118 = fmul contract float %38, %117
  %119 = add nuw nsw i32 %37, 1
  %120 = icmp eq i32 %119, %1
  br i1 %120, label %30, label %35, !llvm.loop !19

121:                                              ; preds = %30
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !15
  br label %122

122:                                              ; preds = %30, %121, %6
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !10, i64 4}
!8 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !9, i64 0}
!9 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !10, i64 0, !10, i64 4, !10, i64 8, !13, i64 12, !14, i64 16, !11, i64 24}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!"float", !11, i64 0}
!14 = !{!"double", !11, i64 0}
!15 = !{!13, !13, i64 0}
!16 = !{!8, !13, i64 12}
!17 = !{!10, !10, i64 0}
!18 = !{!8, !10, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
