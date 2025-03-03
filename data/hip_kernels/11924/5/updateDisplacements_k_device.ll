; ModuleID = '../data/hip_kernels/11924/5/main.cu'
source_filename = "../data/hip_kernels/11924/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21updateDisplacements_kP15HIP_vector_typeIfLj4EES1_PfS1_S1_iS1_j(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, float addrspace(1)* nocapture readnone %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, i32 %5, %struct.HIP_vector_type addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp ult i32 %17, %7
  br i1 %18, label %19, label %238

19:                                               ; preds = %8
  %20 = icmp sgt i32 %5, 0
  br i1 %20, label %21, label %74

21:                                               ; preds = %19
  %22 = mul nsw i32 %17, %5
  %23 = and i32 %5, 7
  %24 = icmp ult i32 %5, 8
  br i1 %24, label %34, label %25

25:                                               ; preds = %21
  %26 = and i32 %5, -8
  br label %127

27:                                               ; preds = %127
  %28 = insertelement <4 x float> %128, float %214, i64 0
  %29 = insertelement <4 x float> %28, float %216, i64 1
  %30 = insertelement <4 x float> %29, float %218, i64 2
  %31 = insertelement <4 x float> %30, float %229, i64 0
  %32 = insertelement <4 x float> %31, float %231, i64 1
  %33 = insertelement <4 x float> %32, float %233, i64 2
  br label %34

34:                                               ; preds = %27, %21
  %35 = phi <4 x float> [ undef, %21 ], [ %30, %27 ]
  %36 = phi float [ undef, %21 ], [ %229, %27 ]
  %37 = phi float [ undef, %21 ], [ %231, %27 ]
  %38 = phi float [ undef, %21 ], [ %233, %27 ]
  %39 = phi <4 x float> [ zeroinitializer, %21 ], [ %33, %27 ]
  %40 = phi i32 [ 0, %21 ], [ %235, %27 ]
  %41 = icmp eq i32 %23, 0
  br i1 %41, label %66, label %42

42:                                               ; preds = %34, %42
  %43 = phi <4 x float> [ %62, %42 ], [ %39, %34 ]
  %44 = phi i32 [ %63, %42 ], [ %40, %34 ]
  %45 = phi i32 [ %64, %42 ], [ 0, %34 ]
  %46 = add nsw i32 %44, %22
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %47, i32 0, i32 0, i32 0, i64 0
  %49 = load float, float addrspace(1)* %48, align 16, !amdgpu.noclobber !5
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %47, i32 0, i32 0, i32 0, i64 1
  %51 = load float, float addrspace(1)* %50, align 4, !amdgpu.noclobber !5
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %47, i32 0, i32 0, i32 0, i64 2
  %53 = load float, float addrspace(1)* %52, align 8, !amdgpu.noclobber !5
  %54 = extractelement <4 x float> %43, i64 0
  %55 = fadd contract float %54, %49
  %56 = insertelement <4 x float> %43, float %55, i64 0
  %57 = extractelement <4 x float> %43, i64 1
  %58 = fadd contract float %57, %51
  %59 = insertelement <4 x float> %56, float %58, i64 1
  %60 = extractelement <4 x float> %43, i64 2
  %61 = fadd contract float %60, %53
  %62 = insertelement <4 x float> %59, float %61, i64 2
  %63 = add nuw nsw i32 %44, 1
  %64 = add i32 %45, 1
  %65 = icmp eq i32 %64, %23
  br i1 %65, label %66, label %42, !llvm.loop !7

66:                                               ; preds = %42, %34
  %67 = phi <4 x float> [ %35, %34 ], [ %43, %42 ]
  %68 = phi float [ %36, %34 ], [ %55, %42 ]
  %69 = phi float [ %37, %34 ], [ %58, %42 ]
  %70 = phi float [ %38, %34 ], [ %61, %42 ]
  %71 = insertelement <4 x float> %67, float %68, i64 0
  %72 = insertelement <4 x float> %71, float %69, i64 1
  %73 = insertelement <4 x float> %72, float %70, i64 2
  br label %74

74:                                               ; preds = %66, %19
  %75 = phi <4 x float> [ %73, %66 ], [ zeroinitializer, %19 ]
  %76 = sext i32 %17 to i64
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %76, i32 0, i32 0, i32 0, i64 0
  %78 = load float, float addrspace(1)* %77, align 16, !amdgpu.noclobber !5
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %76, i32 0, i32 0, i32 0, i64 1
  %80 = load float, float addrspace(1)* %79, align 4, !amdgpu.noclobber !5
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %76, i32 0, i32 0, i32 0, i64 2
  %82 = load float, float addrspace(1)* %81, align 8, !amdgpu.noclobber !5
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %76, i32 0, i32 0, i32 0, i64 0
  %84 = load float, float addrspace(1)* %83, align 16, !amdgpu.noclobber !5
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %76, i32 0, i32 0, i32 0, i64 1
  %86 = load float, float addrspace(1)* %85, align 4, !amdgpu.noclobber !5
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %76, i32 0, i32 0, i32 0, i64 2
  %88 = load float, float addrspace(1)* %87, align 8, !amdgpu.noclobber !5
  %89 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %76
  %90 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %89, i64 0, i32 0, i32 0, i32 0, i64 0
  %91 = load float, float addrspace(1)* %90, align 16, !amdgpu.noclobber !5
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %76, i32 0, i32 0, i32 0, i64 1
  %93 = load float, float addrspace(1)* %92, align 4, !amdgpu.noclobber !5
  %94 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %76, i32 0, i32 0, i32 0, i64 2
  %95 = load float, float addrspace(1)* %94, align 8, !amdgpu.noclobber !5
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %76, i32 0, i32 0, i32 0, i64 0
  %97 = load float, float addrspace(1)* %96, align 16, !amdgpu.noclobber !5
  %98 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %76, i32 0, i32 0, i32 0, i64 1
  %99 = load float, float addrspace(1)* %98, align 4, !amdgpu.noclobber !5
  %100 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %76, i32 0, i32 0, i32 0, i64 2
  %101 = load float, float addrspace(1)* %100, align 8, !amdgpu.noclobber !5
  %102 = extractelement <4 x float> %75, i64 0
  %103 = fsub contract float %97, %102
  %104 = fmul contract float %78, %103
  %105 = fmul contract float %80, %84
  %106 = fadd contract float %105, %104
  %107 = fmul contract float %82, %91
  %108 = fadd contract float %107, %106
  %109 = extractelement <4 x float> %75, i64 1
  %110 = fsub contract float %99, %109
  %111 = fmul contract float %78, %110
  %112 = fmul contract float %80, %86
  %113 = fadd contract float %112, %111
  %114 = fmul contract float %82, %93
  %115 = fadd contract float %114, %113
  %116 = extractelement <4 x float> %75, i64 2
  %117 = fsub contract float %101, %116
  %118 = fmul contract float %78, %117
  %119 = fmul contract float %80, %88
  %120 = fadd contract float %119, %118
  %121 = fmul contract float %82, %95
  %122 = fadd contract float %121, %120
  %123 = insertelement <4 x float> <float poison, float poison, float poison, float 0.000000e+00>, float %108, i64 0
  %124 = insertelement <4 x float> %123, float %115, i64 1
  %125 = insertelement <4 x float> %124, float %122, i64 2
  %126 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %89, i64 0, i32 0, i32 0, i32 0
  store <4 x float> %125, <4 x float> addrspace(1)* %126, align 16
  br label %238

127:                                              ; preds = %127, %25
  %128 = phi <4 x float> [ zeroinitializer, %25 ], [ %234, %127 ]
  %129 = phi i32 [ 0, %25 ], [ %235, %127 ]
  %130 = phi i32 [ 0, %25 ], [ %236, %127 ]
  %131 = add nsw i32 %129, %22
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %132, i32 0, i32 0, i32 0, i64 0
  %134 = load float, float addrspace(1)* %133, align 16, !amdgpu.noclobber !5
  %135 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %132, i32 0, i32 0, i32 0, i64 1
  %136 = load float, float addrspace(1)* %135, align 4, !amdgpu.noclobber !5
  %137 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %132, i32 0, i32 0, i32 0, i64 2
  %138 = load float, float addrspace(1)* %137, align 8, !amdgpu.noclobber !5
  %139 = extractelement <4 x float> %128, i64 0
  %140 = fadd contract float %139, %134
  %141 = extractelement <4 x float> %128, i64 1
  %142 = fadd contract float %141, %136
  %143 = extractelement <4 x float> %128, i64 2
  %144 = fadd contract float %143, %138
  %145 = or i32 %129, 1
  %146 = add nsw i32 %145, %22
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %147, i32 0, i32 0, i32 0, i64 0
  %149 = load float, float addrspace(1)* %148, align 16, !amdgpu.noclobber !5
  %150 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %147, i32 0, i32 0, i32 0, i64 1
  %151 = load float, float addrspace(1)* %150, align 4, !amdgpu.noclobber !5
  %152 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %147, i32 0, i32 0, i32 0, i64 2
  %153 = load float, float addrspace(1)* %152, align 8, !amdgpu.noclobber !5
  %154 = fadd contract float %140, %149
  %155 = fadd contract float %142, %151
  %156 = fadd contract float %144, %153
  %157 = or i32 %129, 2
  %158 = add nsw i32 %157, %22
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %159, i32 0, i32 0, i32 0, i64 0
  %161 = load float, float addrspace(1)* %160, align 16, !amdgpu.noclobber !5
  %162 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %159, i32 0, i32 0, i32 0, i64 1
  %163 = load float, float addrspace(1)* %162, align 4, !amdgpu.noclobber !5
  %164 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %159, i32 0, i32 0, i32 0, i64 2
  %165 = load float, float addrspace(1)* %164, align 8, !amdgpu.noclobber !5
  %166 = fadd contract float %154, %161
  %167 = fadd contract float %155, %163
  %168 = fadd contract float %156, %165
  %169 = or i32 %129, 3
  %170 = add nsw i32 %169, %22
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %171, i32 0, i32 0, i32 0, i64 0
  %173 = load float, float addrspace(1)* %172, align 16, !amdgpu.noclobber !5
  %174 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %171, i32 0, i32 0, i32 0, i64 1
  %175 = load float, float addrspace(1)* %174, align 4, !amdgpu.noclobber !5
  %176 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %171, i32 0, i32 0, i32 0, i64 2
  %177 = load float, float addrspace(1)* %176, align 8, !amdgpu.noclobber !5
  %178 = fadd contract float %166, %173
  %179 = fadd contract float %167, %175
  %180 = fadd contract float %168, %177
  %181 = or i32 %129, 4
  %182 = add nsw i32 %181, %22
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %183, i32 0, i32 0, i32 0, i64 0
  %185 = load float, float addrspace(1)* %184, align 16, !amdgpu.noclobber !5
  %186 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %183, i32 0, i32 0, i32 0, i64 1
  %187 = load float, float addrspace(1)* %186, align 4, !amdgpu.noclobber !5
  %188 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %183, i32 0, i32 0, i32 0, i64 2
  %189 = load float, float addrspace(1)* %188, align 8, !amdgpu.noclobber !5
  %190 = fadd contract float %178, %185
  %191 = fadd contract float %179, %187
  %192 = fadd contract float %180, %189
  %193 = or i32 %129, 5
  %194 = add nsw i32 %193, %22
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %195, i32 0, i32 0, i32 0, i64 0
  %197 = load float, float addrspace(1)* %196, align 16, !amdgpu.noclobber !5
  %198 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %195, i32 0, i32 0, i32 0, i64 1
  %199 = load float, float addrspace(1)* %198, align 4, !amdgpu.noclobber !5
  %200 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %195, i32 0, i32 0, i32 0, i64 2
  %201 = load float, float addrspace(1)* %200, align 8, !amdgpu.noclobber !5
  %202 = fadd contract float %190, %197
  %203 = fadd contract float %191, %199
  %204 = fadd contract float %192, %201
  %205 = or i32 %129, 6
  %206 = add nsw i32 %205, %22
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %207, i32 0, i32 0, i32 0, i64 0
  %209 = load float, float addrspace(1)* %208, align 16, !amdgpu.noclobber !5
  %210 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %207, i32 0, i32 0, i32 0, i64 1
  %211 = load float, float addrspace(1)* %210, align 4, !amdgpu.noclobber !5
  %212 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %207, i32 0, i32 0, i32 0, i64 2
  %213 = load float, float addrspace(1)* %212, align 8, !amdgpu.noclobber !5
  %214 = fadd contract float %202, %209
  %215 = insertelement <4 x float> %128, float %214, i64 0
  %216 = fadd contract float %203, %211
  %217 = insertelement <4 x float> %215, float %216, i64 1
  %218 = fadd contract float %204, %213
  %219 = insertelement <4 x float> %217, float %218, i64 2
  %220 = or i32 %129, 7
  %221 = add nsw i32 %220, %22
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %222, i32 0, i32 0, i32 0, i64 0
  %224 = load float, float addrspace(1)* %223, align 16, !amdgpu.noclobber !5
  %225 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %222, i32 0, i32 0, i32 0, i64 1
  %226 = load float, float addrspace(1)* %225, align 4, !amdgpu.noclobber !5
  %227 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %222, i32 0, i32 0, i32 0, i64 2
  %228 = load float, float addrspace(1)* %227, align 8, !amdgpu.noclobber !5
  %229 = fadd contract float %214, %224
  %230 = insertelement <4 x float> %219, float %229, i64 0
  %231 = fadd contract float %216, %226
  %232 = insertelement <4 x float> %230, float %231, i64 1
  %233 = fadd contract float %218, %228
  %234 = insertelement <4 x float> %232, float %233, i64 2
  %235 = add nuw nsw i32 %129, 8
  %236 = add i32 %130, 8
  %237 = icmp eq i32 %236, %26
  br i1 %237, label %27, label %127, !llvm.loop !9

238:                                              ; preds = %8, %74
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
