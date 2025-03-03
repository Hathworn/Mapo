; ModuleID = '../data/hip_kernels/6394/7/main.cu'
source_filename = "../data/hip_kernels/6394/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12gpuCrossoverPcP12hiprandStateiiifS_(i8 addrspace(1)* nocapture %0, %struct.hiprandState addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float %5, i8 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 0
  %18 = load i32, i32 addrspace(1)* %17, align 8, !amdgpu.noclobber !5
  %19 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 0
  %20 = load i32, i32 addrspace(1)* %19, align 8, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 1
  %22 = load i32, i32 addrspace(1)* %21, align 4, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 2
  %24 = load i32, i32 addrspace(1)* %23, align 8, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 3
  %26 = load i32, i32 addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 4
  %28 = load i32, i32 addrspace(1)* %27, align 8, !amdgpu.noclobber !5
  %29 = lshr i32 %20, 2
  %30 = xor i32 %29, %20
  %31 = shl i32 %28, 4
  %32 = shl i32 %30, 1
  %33 = xor i32 %32, %31
  %34 = xor i32 %33, %30
  %35 = xor i32 %34, %28
  %36 = add i32 %18, 362437
  store i32 %36, i32 addrspace(1)* %17, align 8
  store i32 %22, i32 addrspace(1)* %19, align 8
  store i32 %24, i32 addrspace(1)* %21, align 4
  store i32 %26, i32 addrspace(1)* %23, align 8
  store i32 %28, i32 addrspace(1)* %25, align 4
  store i32 %35, i32 addrspace(1)* %27, align 8
  %37 = sitofp i32 %2 to float
  %38 = shl nsw i32 %16, 1
  %39 = mul nsw i32 %38, %2
  %40 = add nsw i32 %39, %2
  %41 = add nsw i32 %40, %2
  %42 = mul nsw i32 %3, %2
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %73

44:                                               ; preds = %7
  %45 = add i32 %35, %36
  %46 = uitofp i32 %45 to float
  %47 = fmul contract float %46, 0x3DF0000000000000
  %48 = fadd contract float %47, 0x3DF0000000000000
  %49 = fmul contract float %48, %37
  %50 = fptosi float %49 to i32
  %51 = icmp slt i32 %50, %2
  br i1 %51, label %52, label %73

52:                                               ; preds = %44
  %53 = add nsw i32 %39, %50
  %54 = add nsw i32 %40, %50
  %55 = sext i32 %53 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %55
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7
  br label %60

60:                                               ; preds = %60, %52
  %61 = phi i8 [ %59, %52 ], [ %63, %60 ]
  %62 = phi i32 [ %50, %52 ], [ %64, %60 ]
  %63 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7
  store i8 %61, i8 addrspace(1)* %56, align 1, !tbaa !7
  store i8 %63, i8 addrspace(1)* %58, align 1, !tbaa !7
  %64 = add nsw i32 %62, 1
  %65 = icmp slt i32 %64, %2
  br i1 %65, label %60, label %66, !llvm.loop !10

66:                                               ; preds = %60
  %67 = load i32, i32 addrspace(1)* %17, align 8
  %68 = load i32, i32 addrspace(1)* %19, align 8
  %69 = load i32, i32 addrspace(1)* %21, align 4
  %70 = load i32, i32 addrspace(1)* %23, align 8
  %71 = load i32, i32 addrspace(1)* %25, align 4
  %72 = load i32, i32 addrspace(1)* %27, align 8
  br label %73

73:                                               ; preds = %66, %44, %7
  %74 = phi i32 [ %72, %66 ], [ %35, %44 ], [ %35, %7 ]
  %75 = phi i32 [ %71, %66 ], [ %28, %44 ], [ %28, %7 ]
  %76 = phi i32 [ %70, %66 ], [ %26, %44 ], [ %26, %7 ]
  %77 = phi i32 [ %69, %66 ], [ %24, %44 ], [ %24, %7 ]
  %78 = phi i32 [ %68, %66 ], [ %22, %44 ], [ %22, %7 ]
  %79 = phi i32 [ %67, %66 ], [ %36, %44 ], [ %36, %7 ]
  %80 = lshr i32 %78, 2
  %81 = xor i32 %80, %78
  %82 = shl i32 %74, 4
  %83 = shl i32 %81, 1
  %84 = xor i32 %83, %82
  %85 = xor i32 %84, %81
  %86 = xor i32 %85, %74
  %87 = add i32 %79, 362437
  %88 = add i32 %86, %87
  %89 = uitofp i32 %88 to float
  %90 = fmul contract float %89, 0x3DF0000000000000
  %91 = fadd contract float %90, 0x3DF0000000000000
  store i32 %87, i32 addrspace(1)* %17, align 8
  store i32 %77, i32 addrspace(1)* %19, align 8
  store i32 %76, i32 addrspace(1)* %21, align 4
  store i32 %75, i32 addrspace(1)* %23, align 8
  store i32 %74, i32 addrspace(1)* %25, align 4
  store i32 %86, i32 addrspace(1)* %27, align 8
  %92 = fmul contract float %91, 1.000000e+02
  %93 = fptosi float %92 to i32
  %94 = sitofp i32 %93 to float
  %95 = fmul contract float %5, 1.000000e+02
  %96 = fcmp contract ogt float %95, %94
  br i1 %96, label %97, label %244

97:                                               ; preds = %73
  %98 = lshr i32 %77, 2
  %99 = xor i32 %98, %77
  %100 = shl i32 %86, 4
  %101 = shl i32 %99, 1
  %102 = xor i32 %101, %100
  %103 = xor i32 %102, %99
  %104 = xor i32 %103, %86
  %105 = add i32 %79, 724874
  %106 = add i32 %104, %105
  %107 = uitofp i32 %106 to float
  %108 = fmul contract float %107, 0x3DF0000000000000
  %109 = fadd contract float %108, 0x3DF0000000000000
  store i32 %105, i32 addrspace(1)* %17, align 8
  store i32 %76, i32 addrspace(1)* %19, align 8
  store i32 %75, i32 addrspace(1)* %21, align 4
  store i32 %74, i32 addrspace(1)* %23, align 8
  store i32 %86, i32 addrspace(1)* %25, align 4
  store i32 %104, i32 addrspace(1)* %27, align 8
  %110 = sdiv i32 %2, 4
  %111 = sitofp i32 %110 to float
  %112 = fmul contract float %109, %111
  %113 = fptosi float %112 to i32
  %114 = icmp sgt i32 %113, 0
  br i1 %114, label %115, label %244

115:                                              ; preds = %97
  %116 = and i32 %113, 1
  %117 = icmp eq i32 %113, 1
  br i1 %117, label %202, label %118

118:                                              ; preds = %115
  %119 = and i32 %113, -2
  br label %120

120:                                              ; preds = %120, %118
  %121 = phi i32 [ 0, %118 ], [ %200, %120 ]
  %122 = load i32, i32 addrspace(1)* %17, align 8
  %123 = load i32, i32 addrspace(1)* %19, align 8
  %124 = load i32, i32 addrspace(1)* %21, align 4
  %125 = load i32, i32 addrspace(1)* %23, align 8
  %126 = load i32, i32 addrspace(1)* %25, align 4
  %127 = load i32, i32 addrspace(1)* %27, align 8
  %128 = lshr i32 %123, 2
  %129 = xor i32 %128, %123
  %130 = shl i32 %127, 4
  %131 = shl i32 %129, 1
  %132 = xor i32 %131, %130
  %133 = xor i32 %132, %129
  %134 = xor i32 %133, %127
  %135 = add i32 %122, 362437
  %136 = add i32 %134, %135
  %137 = uitofp i32 %136 to float
  %138 = fmul contract float %137, 0x3DF0000000000000
  %139 = fadd contract float %138, 0x3DF0000000000000
  %140 = fmul contract float %139, %37
  %141 = fptosi float %140 to i32
  %142 = lshr i32 %124, 2
  %143 = xor i32 %142, %124
  %144 = shl i32 %134, 4
  %145 = shl i32 %143, 1
  %146 = xor i32 %145, %144
  %147 = xor i32 %146, %143
  %148 = xor i32 %147, %134
  %149 = add i32 %122, 724874
  %150 = add i32 %148, %149
  %151 = uitofp i32 %150 to float
  %152 = fmul contract float %151, 0x3DF0000000000000
  %153 = fadd contract float %152, 0x3DF0000000000000
  store i32 %149, i32 addrspace(1)* %17, align 8
  store i32 %125, i32 addrspace(1)* %19, align 8
  store i32 %126, i32 addrspace(1)* %21, align 4
  store i32 %127, i32 addrspace(1)* %23, align 8
  store i32 %134, i32 addrspace(1)* %25, align 4
  store i32 %148, i32 addrspace(1)* %27, align 8
  %154 = fmul contract float %153, %37
  %155 = fptosi float %154 to i32
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %156
  %158 = load i8, i8 addrspace(1)* %157, align 1, !tbaa !7
  %159 = sext i32 %141 to i64
  %160 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %159
  store i8 %158, i8 addrspace(1)* %160, align 1, !tbaa !7
  %161 = load i32, i32 addrspace(1)* %17, align 8
  %162 = load i32, i32 addrspace(1)* %19, align 8
  %163 = load i32, i32 addrspace(1)* %21, align 4
  %164 = load i32, i32 addrspace(1)* %23, align 8
  %165 = load i32, i32 addrspace(1)* %25, align 4
  %166 = load i32, i32 addrspace(1)* %27, align 8
  %167 = lshr i32 %162, 2
  %168 = xor i32 %167, %162
  %169 = shl i32 %166, 4
  %170 = shl i32 %168, 1
  %171 = xor i32 %170, %169
  %172 = xor i32 %171, %168
  %173 = xor i32 %172, %166
  %174 = add i32 %161, 362437
  %175 = add i32 %173, %174
  %176 = uitofp i32 %175 to float
  %177 = fmul contract float %176, 0x3DF0000000000000
  %178 = fadd contract float %177, 0x3DF0000000000000
  %179 = fmul contract float %178, %37
  %180 = fptosi float %179 to i32
  %181 = lshr i32 %163, 2
  %182 = xor i32 %181, %163
  %183 = shl i32 %173, 4
  %184 = shl i32 %182, 1
  %185 = xor i32 %184, %183
  %186 = xor i32 %185, %182
  %187 = xor i32 %186, %173
  %188 = add i32 %161, 724874
  %189 = add i32 %187, %188
  %190 = uitofp i32 %189 to float
  %191 = fmul contract float %190, 0x3DF0000000000000
  %192 = fadd contract float %191, 0x3DF0000000000000
  store i32 %188, i32 addrspace(1)* %17, align 8
  store i32 %164, i32 addrspace(1)* %19, align 8
  store i32 %165, i32 addrspace(1)* %21, align 4
  store i32 %166, i32 addrspace(1)* %23, align 8
  store i32 %173, i32 addrspace(1)* %25, align 4
  store i32 %187, i32 addrspace(1)* %27, align 8
  %193 = fmul contract float %192, %37
  %194 = fptosi float %193 to i32
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %195
  %197 = load i8, i8 addrspace(1)* %196, align 1, !tbaa !7
  %198 = sext i32 %180 to i64
  %199 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %198
  store i8 %197, i8 addrspace(1)* %199, align 1, !tbaa !7
  %200 = add i32 %121, 2
  %201 = icmp eq i32 %200, %119
  br i1 %201, label %202, label %120, !llvm.loop !12

202:                                              ; preds = %120, %115
  %203 = icmp eq i32 %116, 0
  br i1 %203, label %244, label %204

204:                                              ; preds = %202
  %205 = load i32, i32 addrspace(1)* %17, align 8
  %206 = load i32, i32 addrspace(1)* %19, align 8
  %207 = load i32, i32 addrspace(1)* %21, align 4
  %208 = load i32, i32 addrspace(1)* %23, align 8
  %209 = load i32, i32 addrspace(1)* %25, align 4
  %210 = load i32, i32 addrspace(1)* %27, align 8
  %211 = lshr i32 %206, 2
  %212 = xor i32 %211, %206
  %213 = shl i32 %210, 4
  %214 = shl i32 %212, 1
  %215 = xor i32 %214, %213
  %216 = xor i32 %215, %212
  %217 = xor i32 %216, %210
  %218 = add i32 %205, 362437
  %219 = add i32 %217, %218
  %220 = uitofp i32 %219 to float
  %221 = fmul contract float %220, 0x3DF0000000000000
  %222 = fadd contract float %221, 0x3DF0000000000000
  %223 = fmul contract float %222, %37
  %224 = fptosi float %223 to i32
  %225 = lshr i32 %207, 2
  %226 = xor i32 %225, %207
  %227 = shl i32 %217, 4
  %228 = shl i32 %226, 1
  %229 = xor i32 %228, %227
  %230 = xor i32 %229, %226
  %231 = xor i32 %230, %217
  %232 = add i32 %205, 724874
  %233 = add i32 %231, %232
  %234 = uitofp i32 %233 to float
  %235 = fmul contract float %234, 0x3DF0000000000000
  %236 = fadd contract float %235, 0x3DF0000000000000
  store i32 %232, i32 addrspace(1)* %17, align 8
  store i32 %208, i32 addrspace(1)* %19, align 8
  store i32 %209, i32 addrspace(1)* %21, align 4
  store i32 %210, i32 addrspace(1)* %23, align 8
  store i32 %217, i32 addrspace(1)* %25, align 4
  store i32 %231, i32 addrspace(1)* %27, align 8
  %237 = fmul contract float %236, %37
  %238 = fptosi float %237 to i32
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %239
  %241 = load i8, i8 addrspace(1)* %240, align 1, !tbaa !7
  %242 = sext i32 %224 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %242
  store i8 %241, i8 addrspace(1)* %243, align 1, !tbaa !7
  br label %244

244:                                              ; preds = %204, %202, %97, %73
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
