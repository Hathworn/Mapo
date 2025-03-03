; ModuleID = '../data/hip_kernels/17610/14/main.cu'
source_filename = "../data/hip_kernels/17610/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

$_ZL23gaussdensity_direct_altiPK15HIP_vector_typeIfLj4EEfjPf = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL23gaussdensity_direct_altiPK15HIP_vector_typeIfLj4EEfjPf(i32 %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float %2, i32 %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 comdat {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = shl i32 %6, 3
  %16 = mul i32 %15, %11
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 8, !tbaa !16
  %27 = mul i32 %19, %23
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %29 = add i32 %27, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %31 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 4, !range !4, !invariant.load !5
  %34 = zext i16 %33 to i32
  %35 = mul i32 %30, %34
  %36 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %37 = add i32 %35, %36
  %38 = udiv i32 %14, %11
  %39 = mul i32 %38, %11
  %40 = icmp ugt i32 %14, %39
  %41 = zext i1 %40 to i32
  %42 = add i32 %38, %41
  %43 = shl nuw nsw i32 %11, 3
  %44 = mul i32 %43, %42
  %45 = udiv i32 %26, %23
  %46 = mul i32 %45, %23
  %47 = icmp ugt i32 %26, %46
  %48 = zext i1 %47 to i32
  %49 = add i32 %45, %48
  %50 = mul i32 %37, %23
  %51 = mul i32 %50, %49
  %52 = add i32 %51, %29
  %53 = mul i32 %44, %52
  %54 = add i32 %53, %18
  %55 = add i32 %37, %3
  %56 = uitofp i32 %18 to float
  %57 = fmul contract float %56, %2
  %58 = uitofp i32 %29 to float
  %59 = fmul contract float %58, %2
  %60 = uitofp i32 %55 to float
  %61 = fmul contract float %60, %2
  %62 = fmul contract float %2, 8.000000e+00
  %63 = icmp sgt i32 %0, 0
  br i1 %63, label %64, label %186

64:                                               ; preds = %5, %64
  %65 = phi float [ %99, %64 ], [ 0.000000e+00, %5 ]
  %66 = phi float [ %111, %64 ], [ 0.000000e+00, %5 ]
  %67 = phi float [ %123, %64 ], [ 0.000000e+00, %5 ]
  %68 = phi float [ %135, %64 ], [ 0.000000e+00, %5 ]
  %69 = phi float [ %147, %64 ], [ 0.000000e+00, %5 ]
  %70 = phi float [ %159, %64 ], [ 0.000000e+00, %5 ]
  %71 = phi float [ %171, %64 ], [ 0.000000e+00, %5 ]
  %72 = phi float [ %183, %64 ], [ 0.000000e+00, %5 ]
  %73 = phi i32 [ %184, %64 ], [ 0, %5 ]
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %74, i32 0, i32 0, i32 0, i64 0
  %76 = load float, float addrspace(1)* %75, align 16, !amdgpu.noclobber !5
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %74, i32 0, i32 0, i32 0, i64 1
  %78 = load float, float addrspace(1)* %77, align 4, !amdgpu.noclobber !5
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %74, i32 0, i32 0, i32 0, i64 2
  %80 = load float, float addrspace(1)* %79, align 8, !amdgpu.noclobber !5
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %74, i32 0, i32 0, i32 0, i64 3
  %82 = load float, float addrspace(1)* %81, align 4, !amdgpu.noclobber !5
  %83 = fsub contract float %59, %78
  %84 = fsub contract float %61, %80
  %85 = fmul contract float %83, %83
  %86 = fmul contract float %84, %84
  %87 = fadd contract float %85, %86
  %88 = fsub contract float %57, %76
  %89 = fmul contract float %88, %88
  %90 = fadd contract float %89, %87
  %91 = fneg contract float %90
  %92 = fmul contract float %82, %91
  %93 = fcmp olt float %92, -1.260000e+02
  %94 = select i1 %93, float 0x3BF0000000000000, float 1.000000e+00
  %95 = select i1 %93, float 6.400000e+01, float 0.000000e+00
  %96 = fadd float %92, %95
  %97 = tail call float @llvm.exp2.f32(float %96)
  %98 = fmul float %94, %97
  %99 = fadd contract float %65, %98
  %100 = fadd contract float %62, %88
  %101 = fmul contract float %100, %100
  %102 = fadd contract float %101, %87
  %103 = fneg contract float %102
  %104 = fmul contract float %82, %103
  %105 = fcmp olt float %104, -1.260000e+02
  %106 = select i1 %105, float 0x3BF0000000000000, float 1.000000e+00
  %107 = select i1 %105, float 6.400000e+01, float 0.000000e+00
  %108 = fadd float %104, %107
  %109 = tail call float @llvm.exp2.f32(float %108)
  %110 = fmul float %106, %109
  %111 = fadd contract float %66, %110
  %112 = fadd contract float %62, %100
  %113 = fmul contract float %112, %112
  %114 = fadd contract float %113, %87
  %115 = fneg contract float %114
  %116 = fmul contract float %82, %115
  %117 = fcmp olt float %116, -1.260000e+02
  %118 = select i1 %117, float 0x3BF0000000000000, float 1.000000e+00
  %119 = select i1 %117, float 6.400000e+01, float 0.000000e+00
  %120 = fadd float %116, %119
  %121 = tail call float @llvm.exp2.f32(float %120)
  %122 = fmul float %118, %121
  %123 = fadd contract float %67, %122
  %124 = fadd contract float %62, %112
  %125 = fmul contract float %124, %124
  %126 = fadd contract float %125, %87
  %127 = fneg contract float %126
  %128 = fmul contract float %82, %127
  %129 = fcmp olt float %128, -1.260000e+02
  %130 = select i1 %129, float 0x3BF0000000000000, float 1.000000e+00
  %131 = select i1 %129, float 6.400000e+01, float 0.000000e+00
  %132 = fadd float %128, %131
  %133 = tail call float @llvm.exp2.f32(float %132)
  %134 = fmul float %130, %133
  %135 = fadd contract float %68, %134
  %136 = fadd contract float %62, %124
  %137 = fmul contract float %136, %136
  %138 = fadd contract float %87, %137
  %139 = fneg contract float %138
  %140 = fmul contract float %82, %139
  %141 = fcmp olt float %140, -1.260000e+02
  %142 = select i1 %141, float 0x3BF0000000000000, float 1.000000e+00
  %143 = select i1 %141, float 6.400000e+01, float 0.000000e+00
  %144 = fadd float %140, %143
  %145 = tail call float @llvm.exp2.f32(float %144)
  %146 = fmul float %142, %145
  %147 = fadd contract float %69, %146
  %148 = fadd contract float %62, %136
  %149 = fmul contract float %148, %148
  %150 = fadd contract float %87, %149
  %151 = fneg contract float %150
  %152 = fmul contract float %82, %151
  %153 = fcmp olt float %152, -1.260000e+02
  %154 = select i1 %153, float 0x3BF0000000000000, float 1.000000e+00
  %155 = select i1 %153, float 6.400000e+01, float 0.000000e+00
  %156 = fadd float %152, %155
  %157 = tail call float @llvm.exp2.f32(float %156)
  %158 = fmul float %154, %157
  %159 = fadd contract float %70, %158
  %160 = fadd contract float %62, %148
  %161 = fmul contract float %160, %160
  %162 = fadd contract float %87, %161
  %163 = fneg contract float %162
  %164 = fmul contract float %82, %163
  %165 = fcmp olt float %164, -1.260000e+02
  %166 = select i1 %165, float 0x3BF0000000000000, float 1.000000e+00
  %167 = select i1 %165, float 6.400000e+01, float 0.000000e+00
  %168 = fadd float %164, %167
  %169 = tail call float @llvm.exp2.f32(float %168)
  %170 = fmul float %166, %169
  %171 = fadd contract float %71, %170
  %172 = fadd contract float %62, %160
  %173 = fmul contract float %172, %172
  %174 = fadd contract float %87, %173
  %175 = fneg contract float %174
  %176 = fmul contract float %82, %175
  %177 = fcmp olt float %176, -1.260000e+02
  %178 = select i1 %177, float 0x3BF0000000000000, float 1.000000e+00
  %179 = select i1 %177, float 6.400000e+01, float 0.000000e+00
  %180 = fadd float %176, %179
  %181 = tail call float @llvm.exp2.f32(float %180)
  %182 = fmul float %178, %181
  %183 = fadd contract float %72, %182
  %184 = add nuw nsw i32 %73, 1
  %185 = icmp eq i32 %184, %0
  br i1 %185, label %186, label %64, !llvm.loop !17

186:                                              ; preds = %64, %5
  %187 = phi float [ 0.000000e+00, %5 ], [ %183, %64 ]
  %188 = phi float [ 0.000000e+00, %5 ], [ %171, %64 ]
  %189 = phi float [ 0.000000e+00, %5 ], [ %159, %64 ]
  %190 = phi float [ 0.000000e+00, %5 ], [ %147, %64 ]
  %191 = phi float [ 0.000000e+00, %5 ], [ %135, %64 ]
  %192 = phi float [ 0.000000e+00, %5 ], [ %123, %64 ]
  %193 = phi float [ 0.000000e+00, %5 ], [ %111, %64 ]
  %194 = phi float [ 0.000000e+00, %5 ], [ %99, %64 ]
  %195 = zext i32 %54 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %4, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !19, !amdgpu.noclobber !5
  %198 = fadd contract float %194, %197
  store float %198, float addrspace(1)* %196, align 4, !tbaa !19
  %199 = add i32 %54, 8
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %4, i64 %200
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !19, !amdgpu.noclobber !5
  %203 = fadd contract float %193, %202
  store float %203, float addrspace(1)* %201, align 4, !tbaa !19
  %204 = add i32 %54, 16
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %4, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !19, !amdgpu.noclobber !5
  %208 = fadd contract float %192, %207
  store float %208, float addrspace(1)* %206, align 4, !tbaa !19
  %209 = add i32 %54, 24
  %210 = zext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %4, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !19, !amdgpu.noclobber !5
  %213 = fadd contract float %191, %212
  store float %213, float addrspace(1)* %211, align 4, !tbaa !19
  %214 = add i32 %54, 32
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %4, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !19, !amdgpu.noclobber !5
  %218 = fadd contract float %190, %217
  store float %218, float addrspace(1)* %216, align 4, !tbaa !19
  %219 = add i32 %54, 40
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %4, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !19, !amdgpu.noclobber !5
  %223 = fadd contract float %189, %222
  store float %223, float addrspace(1)* %221, align 4, !tbaa !19
  %224 = add i32 %54, 48
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %4, i64 %225
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !19, !amdgpu.noclobber !5
  %228 = fadd contract float %188, %227
  store float %228, float addrspace(1)* %226, align 4, !tbaa !19
  %229 = add i32 %54, 56
  %230 = zext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %4, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !19, !amdgpu.noclobber !5
  %233 = fadd contract float %187, %232
  store float %233, float addrspace(1)* %231, align 4, !tbaa !19
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
