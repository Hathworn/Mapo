; ModuleID = '../data/hip_kernels/3317/5/main.cu'
source_filename = "../data/hip_kernels/3317/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14float_to_colorP15HIP_vector_typeIhLj4EEPKf(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %13
  %21 = udiv i32 %12, %9
  %22 = mul i32 %21, %9
  %23 = icmp ugt i32 %12, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = add i32 %26, %4
  %28 = mul i32 %27, %9
  %29 = add i32 %28, %3
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !6
  %33 = fmul contract float %32, 3.600000e+02
  %34 = fptosi float %33 to i32
  %35 = add nsw i32 %34, 180
  %36 = srem i32 %35, 360
  %37 = fcmp contract ugt float %32, 5.000000e-01
  %38 = fmul contract float %32, 2.000000e+00
  %39 = fadd contract float %32, 1.000000e+00
  %40 = fsub contract float %39, %32
  %41 = select i1 %37, float %40, float %38
  %42 = fsub contract float %38, %41
  %43 = icmp sgt i32 %36, 240
  %44 = icmp slt i32 %36, -120
  %45 = select i1 %44, i32 480, i32 120
  %46 = select i1 %43, i32 -240, i32 %45
  %47 = add nsw i32 %46, %36
  %48 = icmp ult i32 %47, 60
  br i1 %48, label %49, label %55

49:                                               ; preds = %2
  %50 = fsub contract float %41, %42
  %51 = sitofp i32 %47 to float
  %52 = fmul contract float %50, %51
  %53 = fdiv contract float %52, 6.000000e+01
  %54 = fadd contract float %42, %53
  br label %66

55:                                               ; preds = %2
  %56 = icmp ult i32 %47, 180
  br i1 %56, label %66, label %57

57:                                               ; preds = %55
  %58 = icmp ult i32 %47, 240
  br i1 %58, label %59, label %66

59:                                               ; preds = %57
  %60 = fsub contract float %41, %42
  %61 = sub nuw nsw i32 240, %47
  %62 = sitofp i32 %61 to float
  %63 = fmul contract float %60, %62
  %64 = fdiv contract float %63, 6.000000e+01
  %65 = fadd contract float %42, %64
  br label %66

66:                                               ; preds = %49, %55, %57, %59
  %67 = phi float [ %54, %49 ], [ %65, %59 ], [ %41, %55 ], [ %42, %57 ]
  %68 = fmul contract float %67, 2.550000e+02
  %69 = fptoui float %68 to i8
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 0
  store i8 %69, i8 addrspace(1)* %70, align 4, !tbaa !20
  %71 = icmp slt i32 %36, 0
  %72 = add nsw i32 %36, 360
  %73 = select i1 %71, i32 %72, i32 %36
  %74 = icmp ult i32 %73, 60
  br i1 %74, label %75, label %81

75:                                               ; preds = %66
  %76 = fsub contract float %41, %42
  %77 = sitofp i32 %73 to float
  %78 = fmul contract float %76, %77
  %79 = fdiv contract float %78, 6.000000e+01
  %80 = fadd contract float %42, %79
  br label %92

81:                                               ; preds = %66
  %82 = icmp ult i32 %73, 180
  br i1 %82, label %92, label %83

83:                                               ; preds = %81
  %84 = icmp ult i32 %73, 240
  br i1 %84, label %85, label %92

85:                                               ; preds = %83
  %86 = fsub contract float %41, %42
  %87 = sub nuw nsw i32 240, %73
  %88 = sitofp i32 %87 to float
  %89 = fmul contract float %86, %88
  %90 = fdiv contract float %89, 6.000000e+01
  %91 = fadd contract float %42, %90
  br label %92

92:                                               ; preds = %75, %81, %83, %85
  %93 = phi float [ %80, %75 ], [ %91, %85 ], [ %41, %81 ], [ %42, %83 ]
  %94 = fmul contract float %93, 2.550000e+02
  %95 = fptoui float %94 to i8
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 1
  store i8 %95, i8 addrspace(1)* %96, align 1, !tbaa !20
  %97 = icmp slt i32 %36, 120
  %98 = select i1 %97, i32 240, i32 -120
  %99 = add nsw i32 %98, %36
  %100 = icmp slt i32 %99, 60
  br i1 %100, label %101, label %107

101:                                              ; preds = %92
  %102 = fsub contract float %41, %42
  %103 = sitofp i32 %99 to float
  %104 = fmul contract float %102, %103
  %105 = fdiv contract float %104, 6.000000e+01
  %106 = fadd contract float %42, %105
  br label %118

107:                                              ; preds = %92
  %108 = icmp ult i32 %99, 180
  br i1 %108, label %118, label %109

109:                                              ; preds = %107
  %110 = icmp ult i32 %99, 240
  br i1 %110, label %111, label %118

111:                                              ; preds = %109
  %112 = fsub contract float %41, %42
  %113 = sub nuw nsw i32 240, %99
  %114 = sitofp i32 %113 to float
  %115 = fmul contract float %112, %114
  %116 = fdiv contract float %115, 6.000000e+01
  %117 = fadd contract float %42, %116
  br label %118

118:                                              ; preds = %101, %107, %109, %111
  %119 = phi float [ %106, %101 ], [ %117, %111 ], [ %41, %107 ], [ %42, %109 ]
  %120 = fmul contract float %119, 2.550000e+02
  %121 = fptoui float %120 to i8
  %122 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 2
  store i8 %121, i8 addrspace(1)* %122, align 2, !tbaa !20
  %123 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %123, align 1, !tbaa !20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
