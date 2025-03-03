; ModuleID = '../data/hip_kernels/1838/46/main.cu'
source_filename = "../data/hip_kernels/1838/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z38convert2DVectorToAngleMagnitude_kernelP15HIP_vector_typeIhLj4EES1_PfS2_iiffff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float %6, float %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = shl i32 %11, 8
  %18 = ashr exact i32 %17, 8
  %19 = mul nsw i32 %18, %16
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = shl i32 %22, 8
  %28 = ashr exact i32 %27, 8
  %29 = mul nsw i32 %28, %26
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = icmp slt i32 %21, %4
  %33 = icmp slt i32 %31, %5
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %190

35:                                               ; preds = %10
  %36 = shl i32 %31, 8
  %37 = ashr exact i32 %36, 8
  %38 = shl i32 %4, 8
  %39 = ashr exact i32 %38, 8
  %40 = mul nsw i32 %37, %39
  %41 = add nsw i32 %40, %21
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %42
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = tail call float @llvm.fabs.f32(float %44)
  %48 = tail call float @llvm.fabs.f32(float %46)
  %49 = tail call float @llvm.minnum.f32(float %47, float %48)
  %50 = tail call float @llvm.maxnum.f32(float %47, float %48)
  %51 = fdiv float %49, %50, !fpmath !11
  %52 = fmul float %51, %51
  %53 = tail call float @llvm.fmuladd.f32(float %52, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %54 = tail call float @llvm.fmuladd.f32(float %52, float %53, float 0x3FA53F67E0000000)
  %55 = tail call float @llvm.fmuladd.f32(float %52, float %54, float 0xBFB2FA9AE0000000)
  %56 = tail call float @llvm.fmuladd.f32(float %52, float %55, float 0x3FBB263640000000)
  %57 = tail call float @llvm.fmuladd.f32(float %52, float %56, float 0xBFC22C1CC0000000)
  %58 = tail call float @llvm.fmuladd.f32(float %52, float %57, float 0x3FC99717E0000000)
  %59 = tail call float @llvm.fmuladd.f32(float %52, float %58, float 0xBFD5554C40000000)
  %60 = fmul float %52, %59
  %61 = tail call float @llvm.fmuladd.f32(float %51, float %60, float %51)
  %62 = fsub float 0x3FF921FB60000000, %61
  %63 = fcmp ogt float %48, %47
  %64 = select i1 %63, float %62, float %61
  %65 = fcmp olt float %44, 0.000000e+00
  %66 = fmul contract float %44, %44
  %67 = fmul contract float %46, %46
  %68 = fadd contract float %66, %67
  %69 = fcmp olt float %68, 0x39F0000000000000
  %70 = select i1 %69, float 0x41F0000000000000, float 1.000000e+00
  %71 = fmul float %68, %70
  %72 = tail call float @llvm.sqrt.f32(float %71)
  %73 = bitcast float %72 to i32
  %74 = add nsw i32 %73, -1
  %75 = bitcast i32 %74 to float
  %76 = add nsw i32 %73, 1
  %77 = bitcast i32 %76 to float
  %78 = tail call i1 @llvm.amdgcn.class.f32(float %71, i32 608)
  %79 = select i1 %69, float 0x3EF0000000000000, float 1.000000e+00
  %80 = fneg float %77
  %81 = tail call float @llvm.fma.f32(float %80, float %72, float %71)
  %82 = fcmp ogt float %81, 0.000000e+00
  %83 = fneg float %75
  %84 = tail call float @llvm.fma.f32(float %83, float %72, float %71)
  %85 = fcmp ole float %84, 0.000000e+00
  %86 = select i1 %85, float %75, float %72
  %87 = select i1 %82, float %77, float %86
  %88 = fmul float %79, %87
  %89 = select i1 %78, float %71, float %88
  %90 = tail call i1 @llvm.amdgcn.class.f32(float %89, i32 504)
  br i1 %90, label %91, label %175

91:                                               ; preds = %35
  %92 = fcmp uno float %44, %46
  %93 = fcmp oeq float %48, 0x7FF0000000000000
  %94 = fcmp oeq float %47, 0x7FF0000000000000
  %95 = and i1 %94, %93
  %96 = select i1 %65, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %97 = fcmp oeq float %46, 0.000000e+00
  %98 = bitcast float %44 to i32
  %99 = icmp slt i32 %98, 0
  %100 = select i1 %99, float 0x400921FB60000000, float 0.000000e+00
  %101 = fsub float 0x400921FB60000000, %64
  %102 = select i1 %65, float %101, float %64
  %103 = select i1 %97, float %100, float %102
  %104 = select i1 %95, float %96, float %103
  %105 = select i1 %92, float 0x7FF8000000000000, float %104
  %106 = tail call float @llvm.copysign.f32(float %105, float %46)
  %107 = fsub contract float %106, %6
  %108 = fsub contract float %7, %6
  %109 = fdiv contract float %107, %108
  %110 = fcmp contract olt float %109, 2.500000e-01
  br i1 %110, label %111, label %113

111:                                              ; preds = %91
  %112 = fmul contract float %109, 4.000000e+00
  br label %134

113:                                              ; preds = %91
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
  %141 = fsub contract float %89, %8
  %142 = fsub contract float %9, %8
  %143 = fdiv contract float %141, %142
  %144 = fcmp contract olt float %143, 2.500000e-01
  br i1 %144, label %145, label %147

145:                                              ; preds = %134
  %146 = fmul contract float %143, 4.000000e+00
  br label %168

147:                                              ; preds = %134
  %148 = fcmp contract olt float %143, 5.000000e-01
  br i1 %148, label %149, label %156

149:                                              ; preds = %147
  %150 = fsub contract float 2.500000e-01, %143
  %151 = fmul contract float %150, 4.000000e+00
  %152 = fadd contract float %151, 1.000000e+00
  %153 = fpext float %152 to double
  %154 = fmul contract double %153, 2.550000e+02
  %155 = fptoui double %154 to i8
  br label %168

156:                                              ; preds = %147
  %157 = fcmp contract olt float %143, 7.500000e-01
  br i1 %157, label %158, label %164

158:                                              ; preds = %156
  %159 = fadd contract float %143, -5.000000e-01
  %160 = fmul contract float %159, 4.000000e+00
  %161 = fpext float %160 to double
  %162 = fmul contract double %161, 2.550000e+02
  %163 = fptoui double %162 to i8
  br label %168

164:                                              ; preds = %156
  %165 = fsub contract float 7.500000e-01, %143
  %166 = fmul contract float %165, 4.000000e+00
  %167 = fadd contract float %166, 1.000000e+00
  br label %168

168:                                              ; preds = %149, %164, %158, %145
  %169 = phi i8 [ 0, %145 ], [ 0, %149 ], [ %163, %158 ], [ -1, %164 ]
  %170 = phi float [ %146, %145 ], [ 1.000000e+00, %149 ], [ 1.000000e+00, %158 ], [ %167, %164 ]
  %171 = phi i8 [ -1, %145 ], [ %155, %149 ], [ 0, %158 ], [ 0, %164 ]
  %172 = fpext float %170 to double
  %173 = fmul contract double %172, 2.550000e+02
  %174 = fptoui double %173 to i8
  br label %175

175:                                              ; preds = %35, %168
  %176 = phi i8 [ %140, %168 ], [ -1, %35 ]
  %177 = phi i8 [ %135, %168 ], [ -1, %35 ]
  %178 = phi i8 [ %171, %168 ], [ -1, %35 ]
  %179 = phi i8 [ %174, %168 ], [ -1, %35 ]
  %180 = phi i8 [ %169, %168 ], [ -1, %35 ]
  %181 = phi i8 [ %137, %168 ], [ -1, %35 ]
  %182 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 0, i64 0
  store i8 %177, i8 addrspace(1)* %182, align 4
  %183 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 0, i64 1
  store i8 %176, i8 addrspace(1)* %183, align 1
  %184 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 0, i64 2
  store i8 %181, i8 addrspace(1)* %184, align 2
  %185 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %42, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %185, align 1
  %186 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %42, i32 0, i32 0, i32 0, i64 0
  store i8 %180, i8 addrspace(1)* %186, align 4
  %187 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %42, i32 0, i32 0, i32 0, i64 1
  store i8 %179, i8 addrspace(1)* %187, align 1
  %188 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %42, i32 0, i32 0, i32 0, i64 2
  store i8 %178, i8 addrspace(1)* %188, align 2
  %189 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %42, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %189, align 1
  br label %190

190:                                              ; preds = %175, %10
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{float 2.500000e+00}
