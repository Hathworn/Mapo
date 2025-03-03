; ModuleID = '../data/hip_kernels/1753/40/main.cu'
source_filename = "../data/hip_kernels/1753/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14ccc_cmp_kernalPKfS0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %5
  %11 = add i32 %10, %8
  %12 = add i32 %11, %6
  %13 = freeze i32 %12
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %15, label %62

15:                                               ; preds = %7
  %16 = srem i32 %13, %3
  %17 = sub nsw i32 %13, %16
  %18 = and i32 %3, 7
  %19 = icmp ult i32 %3, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %15
  %21 = and i32 %3, -8
  br label %91

22:                                               ; preds = %91, %15
  %23 = phi float [ undef, %15 ], [ %224, %91 ]
  %24 = phi float [ undef, %15 ], [ %227, %91 ]
  %25 = phi float [ undef, %15 ], [ %229, %91 ]
  %26 = phi float [ undef, %15 ], [ %231, %91 ]
  %27 = phi float [ undef, %15 ], [ %233, %91 ]
  %28 = phi float [ 0.000000e+00, %15 ], [ %224, %91 ]
  %29 = phi i32 [ 0, %15 ], [ %234, %91 ]
  %30 = phi float [ 0.000000e+00, %15 ], [ %227, %91 ]
  %31 = phi float [ 0.000000e+00, %15 ], [ %229, %91 ]
  %32 = phi float [ 0.000000e+00, %15 ], [ %231, %91 ]
  %33 = phi float [ 0.000000e+00, %15 ], [ %233, %91 ]
  %34 = icmp eq i32 %18, 0
  br i1 %34, label %62, label %35

35:                                               ; preds = %22, %35
  %36 = phi float [ %49, %35 ], [ %28, %22 ]
  %37 = phi i32 [ %59, %35 ], [ %29, %22 ]
  %38 = phi float [ %52, %35 ], [ %30, %22 ]
  %39 = phi float [ %54, %35 ], [ %31, %22 ]
  %40 = phi float [ %56, %35 ], [ %32, %22 ]
  %41 = phi float [ %58, %35 ], [ %33, %22 ]
  %42 = phi i32 [ %60, %35 ], [ 0, %22 ]
  %43 = add i32 %17, %37
  %44 = mul i32 %43, %3
  %45 = add i32 %44, %16
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fadd contract float %36, %48
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fadd contract float %38, %51
  %53 = fmul contract float %48, %48
  %54 = fadd contract float %39, %53
  %55 = fmul contract float %51, %51
  %56 = fadd contract float %40, %55
  %57 = fmul contract float %48, %51
  %58 = fadd contract float %41, %57
  %59 = add nuw nsw i32 %37, 1
  %60 = add i32 %42, 1
  %61 = icmp eq i32 %60, %18
  br i1 %61, label %62, label %35, !llvm.loop !10

62:                                               ; preds = %22, %35, %7
  %63 = phi float [ 0.000000e+00, %7 ], [ %27, %22 ], [ %58, %35 ]
  %64 = phi float [ 0.000000e+00, %7 ], [ %26, %22 ], [ %56, %35 ]
  %65 = phi float [ 0.000000e+00, %7 ], [ %25, %22 ], [ %54, %35 ]
  %66 = phi float [ 0.000000e+00, %7 ], [ %24, %22 ], [ %52, %35 ]
  %67 = phi float [ 0.000000e+00, %7 ], [ %23, %22 ], [ %49, %35 ]
  %68 = sitofp i32 %3 to float
  %69 = fdiv contract float %67, %68
  %70 = sext i32 %13 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  store float %69, float addrspace(1)* %71, align 4, !tbaa !5
  %72 = fdiv contract float %66, %68
  %73 = add nsw i32 %13, %4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  store float %72, float addrspace(1)* %75, align 4, !tbaa !5
  %76 = fdiv contract float %65, %68
  %77 = shl nsw i32 %4, 1
  %78 = add nsw i32 %13, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  store float %76, float addrspace(1)* %80, align 4, !tbaa !5
  %81 = fdiv contract float %64, %68
  %82 = mul nsw i32 %4, 3
  %83 = add nsw i32 %13, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  store float %81, float addrspace(1)* %85, align 4, !tbaa !5
  %86 = fdiv contract float %63, %68
  %87 = shl nsw i32 %4, 2
  %88 = add nsw i32 %13, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  store float %86, float addrspace(1)* %90, align 4, !tbaa !5
  ret void

91:                                               ; preds = %91, %20
  %92 = phi float [ 0.000000e+00, %20 ], [ %224, %91 ]
  %93 = phi i32 [ 0, %20 ], [ %234, %91 ]
  %94 = phi float [ 0.000000e+00, %20 ], [ %227, %91 ]
  %95 = phi float [ 0.000000e+00, %20 ], [ %229, %91 ]
  %96 = phi float [ 0.000000e+00, %20 ], [ %231, %91 ]
  %97 = phi float [ 0.000000e+00, %20 ], [ %233, %91 ]
  %98 = phi i32 [ 0, %20 ], [ %235, %91 ]
  %99 = add i32 %17, %93
  %100 = mul i32 %99, %3
  %101 = add i32 %100, %16
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fadd contract float %92, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  %108 = fadd contract float %94, %107
  %109 = fmul contract float %104, %104
  %110 = fadd contract float %95, %109
  %111 = fmul contract float %107, %107
  %112 = fadd contract float %96, %111
  %113 = fmul contract float %104, %107
  %114 = fadd contract float %97, %113
  %115 = or i32 %93, 1
  %116 = add i32 %17, %115
  %117 = mul i32 %116, %3
  %118 = add i32 %117, %16
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = fadd contract float %105, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = fadd contract float %108, %124
  %126 = fmul contract float %121, %121
  %127 = fadd contract float %110, %126
  %128 = fmul contract float %124, %124
  %129 = fadd contract float %112, %128
  %130 = fmul contract float %121, %124
  %131 = fadd contract float %114, %130
  %132 = or i32 %93, 2
  %133 = add i32 %17, %132
  %134 = mul i32 %133, %3
  %135 = add i32 %134, %16
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = fadd contract float %122, %138
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5, !amdgpu.noclobber !9
  %142 = fadd contract float %125, %141
  %143 = fmul contract float %138, %138
  %144 = fadd contract float %127, %143
  %145 = fmul contract float %141, %141
  %146 = fadd contract float %129, %145
  %147 = fmul contract float %138, %141
  %148 = fadd contract float %131, %147
  %149 = or i32 %93, 3
  %150 = add i32 %17, %149
  %151 = mul i32 %150, %3
  %152 = add i32 %151, %16
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !5, !amdgpu.noclobber !9
  %156 = fadd contract float %139, %155
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !5, !amdgpu.noclobber !9
  %159 = fadd contract float %142, %158
  %160 = fmul contract float %155, %155
  %161 = fadd contract float %144, %160
  %162 = fmul contract float %158, %158
  %163 = fadd contract float %146, %162
  %164 = fmul contract float %155, %158
  %165 = fadd contract float %148, %164
  %166 = or i32 %93, 4
  %167 = add i32 %17, %166
  %168 = mul i32 %167, %3
  %169 = add i32 %168, %16
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !5, !amdgpu.noclobber !9
  %173 = fadd contract float %156, %172
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !5, !amdgpu.noclobber !9
  %176 = fadd contract float %159, %175
  %177 = fmul contract float %172, %172
  %178 = fadd contract float %161, %177
  %179 = fmul contract float %175, %175
  %180 = fadd contract float %163, %179
  %181 = fmul contract float %172, %175
  %182 = fadd contract float %165, %181
  %183 = or i32 %93, 5
  %184 = add i32 %17, %183
  %185 = mul i32 %184, %3
  %186 = add i32 %185, %16
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !5, !amdgpu.noclobber !9
  %190 = fadd contract float %173, %189
  %191 = getelementptr inbounds float, float addrspace(1)* %1, i64 %187
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !5, !amdgpu.noclobber !9
  %193 = fadd contract float %176, %192
  %194 = fmul contract float %189, %189
  %195 = fadd contract float %178, %194
  %196 = fmul contract float %192, %192
  %197 = fadd contract float %180, %196
  %198 = fmul contract float %189, %192
  %199 = fadd contract float %182, %198
  %200 = or i32 %93, 6
  %201 = add i32 %17, %200
  %202 = mul i32 %201, %3
  %203 = add i32 %202, %16
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !5, !amdgpu.noclobber !9
  %207 = fadd contract float %190, %206
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %204
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !5, !amdgpu.noclobber !9
  %210 = fadd contract float %193, %209
  %211 = fmul contract float %206, %206
  %212 = fadd contract float %195, %211
  %213 = fmul contract float %209, %209
  %214 = fadd contract float %197, %213
  %215 = fmul contract float %206, %209
  %216 = fadd contract float %199, %215
  %217 = or i32 %93, 7
  %218 = add i32 %17, %217
  %219 = mul i32 %218, %3
  %220 = add i32 %219, %16
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !5, !amdgpu.noclobber !9
  %224 = fadd contract float %207, %223
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %221
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !5, !amdgpu.noclobber !9
  %227 = fadd contract float %210, %226
  %228 = fmul contract float %223, %223
  %229 = fadd contract float %212, %228
  %230 = fmul contract float %226, %226
  %231 = fadd contract float %214, %230
  %232 = fmul contract float %223, %226
  %233 = fadd contract float %216, %232
  %234 = add nuw nsw i32 %93, 8
  %235 = add i32 %98, 8
  %236 = icmp eq i32 %235, %21
  br i1 %236, label %22, label %91, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
