; ModuleID = '../data/hip_kernels/11654/34/main.cu'
source_filename = "../data/hip_kernels/11654/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12rnorm_kernelP12hiprandStatePfiff(%struct.hiprandState addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, i32 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %6
  %23 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = getelementptr i8, i8 addrspace(4)* %8, i64 8
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = mul i32 %22, %30
  %35 = add i32 %34, %31
  %36 = mul i32 %35, %26
  %37 = add i32 %36, %32
  %38 = mul i32 %37, %15
  %39 = add i32 %38, %33
  %40 = icmp slt i32 %39, %2
  br i1 %40, label %41, label %131

41:                                               ; preds = %5
  %42 = sext i32 %39 to i64
  %43 = getelementptr %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 1
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %41
  store i32 0, i32 addrspace(1)* %43, align 4, !tbaa !16
  %47 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 3
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !24, !amdgpu.noclobber !14
  br label %126

49:                                               ; preds = %41
  %50 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 5, i64 0
  %51 = load i32, i32 addrspace(1)* %50, align 8, !tbaa !25, !amdgpu.noclobber !14
  %52 = lshr i32 %51, 2
  %53 = xor i32 %52, %51
  %54 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 5, i64 1
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !25, !amdgpu.noclobber !14
  %56 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 5, i64 2
  %57 = load i32, i32 addrspace(1)* %56, align 8, !tbaa !25, !amdgpu.noclobber !14
  %58 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 5, i64 3
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !25, !amdgpu.noclobber !14
  %60 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 5, i64 4
  %61 = load i32, i32 addrspace(1)* %60, align 8, !tbaa !25, !amdgpu.noclobber !14
  %62 = shl i32 %61, 4
  %63 = shl i32 %53, 1
  %64 = xor i32 %63, %62
  %65 = xor i32 %64, %53
  %66 = xor i32 %65, %61
  %67 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 0
  %68 = load i32, i32 addrspace(1)* %67, align 8, !tbaa !26, !amdgpu.noclobber !14
  %69 = add i32 %68, 362437
  %70 = add i32 %69, %66
  %71 = lshr i32 %55, 2
  %72 = xor i32 %71, %55
  store i32 %57, i32 addrspace(1)* %50, align 8, !tbaa !25
  store i32 %59, i32 addrspace(1)* %54, align 4, !tbaa !25
  store i32 %61, i32 addrspace(1)* %56, align 8, !tbaa !25
  store i32 %66, i32 addrspace(1)* %58, align 4, !tbaa !25
  %73 = shl i32 %66, 4
  %74 = shl i32 %72, 1
  %75 = xor i32 %74, %73
  %76 = xor i32 %75, %72
  %77 = xor i32 %76, %66
  store i32 %77, i32 addrspace(1)* %60, align 8, !tbaa !25
  %78 = add i32 %68, 724874
  store i32 %78, i32 addrspace(1)* %67, align 8, !tbaa !26
  %79 = add i32 %77, %78
  %80 = uitofp i32 %70 to float
  %81 = fmul contract float %80, 0x3DF0000000000000
  %82 = fadd contract float %81, 0x3DF0000000000000
  %83 = uitofp i32 %79 to float
  %84 = fmul contract float %83, 0x3E1921FB60000000
  %85 = fadd contract float %84, 0x3E1921FB60000000
  %86 = tail call i1 @llvm.amdgcn.class.f32(float %82, i32 144)
  %87 = select i1 %86, float 0x41F0000000000000, float 1.000000e+00
  %88 = fmul float %82, %87
  %89 = tail call float @llvm.log2.f32(float %88)
  %90 = fmul float %89, 0x3FE62E42E0000000
  %91 = tail call i1 @llvm.amdgcn.class.f32(float %89, i32 519)
  %92 = fneg float %90
  %93 = tail call float @llvm.fma.f32(float %89, float 0x3FE62E42E0000000, float %92)
  %94 = tail call float @llvm.fma.f32(float %89, float 0x3E6EFA39E0000000, float %93)
  %95 = fadd float %90, %94
  %96 = select i1 %91, float %89, float %95
  %97 = select i1 %86, float 0x40362E4300000000, float 0.000000e+00
  %98 = fsub float %96, %97
  %99 = fmul contract float %98, -2.000000e+00
  %100 = fcmp olt float %99, 0x39F0000000000000
  %101 = select i1 %100, float 0x41F0000000000000, float 1.000000e+00
  %102 = fmul float %99, %101
  %103 = tail call float @llvm.sqrt.f32(float %102)
  %104 = bitcast float %103 to i32
  %105 = add nsw i32 %104, -1
  %106 = bitcast i32 %105 to float
  %107 = add nsw i32 %104, 1
  %108 = bitcast i32 %107 to float
  %109 = tail call i1 @llvm.amdgcn.class.f32(float %102, i32 608)
  %110 = select i1 %100, float 0x3EF0000000000000, float 1.000000e+00
  %111 = fneg float %108
  %112 = tail call float @llvm.fma.f32(float %111, float %103, float %102)
  %113 = fcmp ogt float %112, 0.000000e+00
  %114 = fneg float %106
  %115 = tail call float @llvm.fma.f32(float %114, float %103, float %102)
  %116 = fcmp ole float %115, 0.000000e+00
  %117 = select i1 %116, float %106, float %103
  %118 = select i1 %113, float %108, float %117
  %119 = fmul float %110, %118
  %120 = select i1 %109, float %102, float %119
  %121 = tail call float @llvm.sin.f32(float %85)
  %122 = tail call float @llvm.cos.f32(float %85)
  %123 = fmul contract float %121, %120
  %124 = fmul contract float %122, %120
  store i32 1, i32 addrspace(1)* %43, align 4, !tbaa !16
  %125 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 3
  store float %124, float addrspace(1)* %125, align 4, !tbaa !24
  br label %126

126:                                              ; preds = %46, %49
  %127 = phi float [ %48, %46 ], [ %123, %49 ]
  %128 = fmul contract float %127, %4
  %129 = fadd contract float %128, %3
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %129, float addrspace(1)* %130, align 4, !tbaa !27
  br label %131

131:                                              ; preds = %126, %5
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !19, i64 4}
!17 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !18, i64 0}
!18 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !19, i64 0, !19, i64 4, !19, i64 8, !22, i64 12, !23, i64 16, !20, i64 24}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!"float", !20, i64 0}
!23 = !{!"double", !20, i64 0}
!24 = !{!17, !22, i64 12}
!25 = !{!19, !19, i64 0}
!26 = !{!17, !19, i64 0}
!27 = !{!22, !22, i64 0}
