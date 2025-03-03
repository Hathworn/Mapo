; ModuleID = '../data/hip_kernels/1838/41/main.cu'
source_filename = "../data/hip_kernels/1838/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z24convertFlowToRGBA_kernelP15HIP_vector_typeIhLj4EES1_PKfS3_iifff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float %6, float %7, float %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = shl i32 %10, 8
  %17 = ashr exact i32 %16, 8
  %18 = mul nsw i32 %17, %15
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = shl i32 %21, 8
  %27 = ashr exact i32 %26, 8
  %28 = mul nsw i32 %27, %25
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %20, %4
  %32 = icmp slt i32 %30, %5
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %156

34:                                               ; preds = %9
  %35 = shl i32 %30, 8
  %36 = ashr exact i32 %35, 8
  %37 = shl i32 %4, 8
  %38 = ashr exact i32 %37, 8
  %39 = mul nsw i32 %36, %38
  %40 = add nsw i32 %39, %20
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = fmul contract float %43, %43
  %47 = fmul contract float %45, %45
  %48 = fadd contract float %46, %47
  %49 = fcmp olt float %48, 0x39F0000000000000
  %50 = select i1 %49, float 0x41F0000000000000, float 1.000000e+00
  %51 = fmul float %48, %50
  %52 = tail call float @llvm.sqrt.f32(float %51)
  %53 = bitcast float %52 to i32
  %54 = add nsw i32 %53, -1
  %55 = bitcast i32 %54 to float
  %56 = add nsw i32 %53, 1
  %57 = bitcast i32 %56 to float
  %58 = tail call i1 @llvm.amdgcn.class.f32(float %51, i32 608)
  %59 = select i1 %49, float 0x3EF0000000000000, float 1.000000e+00
  %60 = fneg float %57
  %61 = tail call float @llvm.fma.f32(float %60, float %52, float %51)
  %62 = fcmp ogt float %61, 0.000000e+00
  %63 = fneg float %55
  %64 = tail call float @llvm.fma.f32(float %63, float %52, float %51)
  %65 = fcmp ole float %64, 0.000000e+00
  %66 = select i1 %65, float %55, float %52
  %67 = select i1 %62, float %57, float %66
  %68 = fmul float %59, %67
  %69 = select i1 %58, float %51, float %68
  %70 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 504)
  %71 = fcmp contract uge float %69, %8
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %73, label %141

73:                                               ; preds = %34
  %74 = fsub contract float %43, %6
  %75 = fsub contract float %7, %6
  %76 = fdiv contract float %74, %75
  %77 = fcmp contract olt float %76, 2.500000e-01
  br i1 %77, label %78, label %80

78:                                               ; preds = %73
  %79 = fmul contract float %76, 4.000000e+00
  br label %101

80:                                               ; preds = %73
  %81 = fcmp contract olt float %76, 5.000000e-01
  br i1 %81, label %82, label %89

82:                                               ; preds = %80
  %83 = fsub contract float 2.500000e-01, %76
  %84 = fmul contract float %83, 4.000000e+00
  %85 = fadd contract float %84, 1.000000e+00
  %86 = fpext float %85 to double
  %87 = fmul contract double %86, 2.550000e+02
  %88 = fptoui double %87 to i8
  br label %101

89:                                               ; preds = %80
  %90 = fcmp contract olt float %76, 7.500000e-01
  br i1 %90, label %91, label %97

91:                                               ; preds = %89
  %92 = fadd contract float %76, -5.000000e-01
  %93 = fmul contract float %92, 4.000000e+00
  %94 = fpext float %93 to double
  %95 = fmul contract double %94, 2.550000e+02
  %96 = fptoui double %95 to i8
  br label %101

97:                                               ; preds = %89
  %98 = fsub contract float 7.500000e-01, %76
  %99 = fmul contract float %98, 4.000000e+00
  %100 = fadd contract float %99, 1.000000e+00
  br label %101

101:                                              ; preds = %82, %97, %91, %78
  %102 = phi i8 [ 0, %78 ], [ 0, %82 ], [ %96, %91 ], [ -1, %97 ]
  %103 = phi float [ %79, %78 ], [ 1.000000e+00, %82 ], [ 1.000000e+00, %91 ], [ %100, %97 ]
  %104 = phi i8 [ -1, %78 ], [ %88, %82 ], [ 0, %91 ], [ 0, %97 ]
  %105 = fpext float %103 to double
  %106 = fmul contract double %105, 2.550000e+02
  %107 = fptoui double %106 to i8
  %108 = fsub contract float %45, %6
  %109 = fdiv contract float %108, %75
  %110 = fcmp contract olt float %109, 2.500000e-01
  br i1 %110, label %111, label %113

111:                                              ; preds = %101
  %112 = fmul contract float %109, 4.000000e+00
  br label %134

113:                                              ; preds = %101
  %114 = fcmp contract olt float %109, 5.000000e-01
  br i1 %114, label %115, label %122

115:                                              ; preds = %113
  %116 = fsub contract float 2.500000e-01, %109
  %117 = fmul contract float %116, 4.000000e+00
  %118 = fadd contract float %117, 1.000000e+00
  %119 = fpext float %118 to double
  %120 = fmul contract double %119, 2.550000e+02
  %121 = fptoui double %120 to i8
  br label %134

122:                                              ; preds = %113
  %123 = fcmp contract olt float %109, 7.500000e-01
  br i1 %123, label %124, label %130

124:                                              ; preds = %122
  %125 = fadd contract float %109, -5.000000e-01
  %126 = fmul contract float %125, 4.000000e+00
  %127 = fpext float %126 to double
  %128 = fmul contract double %127, 2.550000e+02
  %129 = fptoui double %128 to i8
  br label %134

130:                                              ; preds = %122
  %131 = fsub contract float 7.500000e-01, %109
  %132 = fmul contract float %131, 4.000000e+00
  %133 = fadd contract float %132, 1.000000e+00
  br label %134

134:                                              ; preds = %115, %130, %124, %111
  %135 = phi i8 [ 0, %111 ], [ 0, %115 ], [ %129, %124 ], [ -1, %130 ]
  %136 = phi float [ %112, %111 ], [ 1.000000e+00, %115 ], [ 1.000000e+00, %124 ], [ %133, %130 ]
  %137 = phi i8 [ -1, %111 ], [ %121, %115 ], [ 0, %124 ], [ 0, %130 ]
  %138 = fpext float %136 to double
  %139 = fmul contract double %138, 2.550000e+02
  %140 = fptoui double %139 to i8
  br label %141

141:                                              ; preds = %34, %134
  %142 = phi i8 [ %104, %134 ], [ -1, %34 ]
  %143 = phi i8 [ %107, %134 ], [ -1, %34 ]
  %144 = phi i8 [ %102, %134 ], [ -1, %34 ]
  %145 = phi i8 [ %137, %134 ], [ -1, %34 ]
  %146 = phi i8 [ %140, %134 ], [ -1, %34 ]
  %147 = phi i8 [ %135, %134 ], [ -1, %34 ]
  %148 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0, i64 0
  store i8 %144, i8 addrspace(1)* %148, align 4
  %149 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0, i64 1
  store i8 %143, i8 addrspace(1)* %149, align 1
  %150 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0, i64 2
  store i8 %142, i8 addrspace(1)* %150, align 2
  %151 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %151, align 1
  %152 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 0
  store i8 %147, i8 addrspace(1)* %152, align 4
  %153 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 1
  store i8 %146, i8 addrspace(1)* %153, align 1
  %154 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 2
  store i8 %145, i8 addrspace(1)* %154, align 2
  %155 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %155, align 1
  br label %156

156:                                              ; preds = %141, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
