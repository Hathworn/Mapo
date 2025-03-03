; ModuleID = '../data/hip_kernels/3603/19/main.cu'
source_filename = "../data/hip_kernels/3603/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }
%struct.HIP_vector_type.4 = type { %struct.HIP_vector_base.5 }
%struct.HIP_vector_base.5 = type { %union.anon.6 }
%union.anon.6 = type { <2 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25SampleVelocitiesSlicedDevPfjPK15HIP_vector_typeIfLj4EEPKS0_IjLj2EEPKj(float addrspace(1)* nocapture writeonly %0, i32 %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type.4 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = mul i32 %13, %1
  %21 = mul i32 %20, %18
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %19
  %25 = add i32 %24, %21
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds %struct.HIP_vector_type.4, %struct.HIP_vector_type.4 addrspace(1)* %3, i64 %26, i32 0, i32 0, i32 0, i64 0
  %28 = bitcast i32 addrspace(1)* %27 to <2 x i32> addrspace(1)*
  %29 = load <2 x i32>, <2 x i32> addrspace(1)* %28, align 8
  %30 = extractelement <2 x i32> %29, i64 0
  %31 = extractelement <2 x i32> %29, i64 1
  %32 = sub i32 %31, %30
  %33 = icmp eq i32 %31, %30
  br i1 %33, label %97, label %34

34:                                               ; preds = %5
  %35 = icmp ugt i32 %31, %30
  br i1 %35, label %73, label %40

36:                                               ; preds = %73
  %37 = insertelement <4 x float> %74, float %87, i64 0
  %38 = insertelement <4 x float> %37, float %90, i64 1
  %39 = insertelement <4 x float> %38, float %93, i64 2
  br label %40

40:                                               ; preds = %36, %34
  %41 = phi <4 x float> [ %39, %36 ], [ zeroinitializer, %34 ]
  %42 = extractelement <4 x float> %41, i64 0
  %43 = fmul contract float %42, %42
  %44 = extractelement <4 x float> %41, i64 1
  %45 = fmul contract float %44, %44
  %46 = fadd contract float %43, %45
  %47 = extractelement <4 x float> %41, i64 2
  %48 = fmul contract float %47, %47
  %49 = fadd contract float %48, %46
  %50 = fcmp olt float %49, 0x39F0000000000000
  %51 = select i1 %50, float 0x41F0000000000000, float 1.000000e+00
  %52 = fmul float %49, %51
  %53 = tail call float @llvm.sqrt.f32(float %52)
  %54 = bitcast float %53 to i32
  %55 = add nsw i32 %54, -1
  %56 = bitcast i32 %55 to float
  %57 = add nsw i32 %54, 1
  %58 = bitcast i32 %57 to float
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 608)
  %60 = select i1 %50, float 0x3EF0000000000000, float 1.000000e+00
  %61 = fneg float %58
  %62 = tail call float @llvm.fma.f32(float %61, float %53, float %52)
  %63 = fcmp ogt float %62, 0.000000e+00
  %64 = fneg float %56
  %65 = tail call float @llvm.fma.f32(float %64, float %53, float %52)
  %66 = fcmp ole float %65, 0.000000e+00
  %67 = select i1 %66, float %56, float %53
  %68 = select i1 %63, float %58, float %67
  %69 = fmul float %60, %68
  %70 = select i1 %59, float %52, float %69
  %71 = uitofp i32 %32 to float
  %72 = fdiv contract float %70, %71
  br label %97

73:                                               ; preds = %34, %73
  %74 = phi <4 x float> [ %94, %73 ], [ zeroinitializer, %34 ]
  %75 = phi i32 [ %95, %73 ], [ %30, %34 ]
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !14
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %79, i32 0, i32 0, i32 0, i64 0
  %81 = load float, float addrspace(1)* %80, align 16, !amdgpu.noclobber !14
  %82 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %79, i32 0, i32 0, i32 0, i64 1
  %83 = load float, float addrspace(1)* %82, align 4, !amdgpu.noclobber !14
  %84 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %79, i32 0, i32 0, i32 0, i64 2
  %85 = load float, float addrspace(1)* %84, align 8, !amdgpu.noclobber !14
  %86 = extractelement <4 x float> %74, i64 0
  %87 = fadd contract float %86, %81
  %88 = insertelement <4 x float> %74, float %87, i64 0
  %89 = extractelement <4 x float> %74, i64 1
  %90 = fadd contract float %89, %83
  %91 = insertelement <4 x float> %88, float %90, i64 1
  %92 = extractelement <4 x float> %74, i64 2
  %93 = fadd contract float %92, %85
  %94 = insertelement <4 x float> %91, float %93, i64 2
  %95 = add nuw i32 %75, 1
  %96 = icmp ult i32 %95, %31
  br i1 %96, label %73, label %36, !llvm.loop !20

97:                                               ; preds = %5, %40
  %98 = phi float [ %72, %40 ], [ 0.000000e+00, %5 ]
  %99 = zext i32 %24 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  store float %98, float addrspace(1)* %100, align 4, !tbaa !22
  ret void
}

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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
