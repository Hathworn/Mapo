; ModuleID = '../data/hip_kernels/16910/23/main.cu'
source_filename = "../data/hip_kernels/16910/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14addback_spikesPKdPKiS2_PKfS2_PfS4_S4_iS4_(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i32 %8, float addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !4, !amdgpu.noclobber !8
  %24 = fptosi double %23 to i32
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 11
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !8
  %27 = fptrunc double %26 to float
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %29 = sext i32 %8 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !10, !amdgpu.noclobber !8
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %33 = add i32 %31, %32
  %34 = add nsw i32 %8, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !10, !amdgpu.noclobber !8
  %38 = icmp slt i32 %33, %37
  br i1 %38, label %39, label %247

39:                                               ; preds = %10
  %40 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %41 = icmp sge i32 %40, %18
  %42 = icmp sgt i32 %24, 0
  %43 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %44 = getelementptr i8, i8 addrspace(4)* %43, i64 6
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 12
  %47 = bitcast i8 addrspace(4)* %46 to i32 addrspace(4)*
  %48 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !12
  %49 = getelementptr i8, i8 addrspace(4)* %43, i64 4
  %50 = bitcast i8 addrspace(4)* %49 to i16 addrspace(4)*
  %51 = load i16, i16 addrspace(4)* %50, align 4, !range !21, !invariant.load !8
  %52 = zext i16 %51 to i32
  %53 = udiv i32 %48, %52
  %54 = mul i32 %53, %52
  %55 = icmp ugt i32 %48, %54
  %56 = zext i1 %55 to i32
  %57 = and i32 %24, 7
  %58 = icmp ult i32 %24, 8
  %59 = and i32 %24, -8
  %60 = icmp eq i32 %57, 0
  br label %61

61:                                               ; preds = %39, %243
  %62 = phi i32 [ %33, %39 ], [ %245, %243 ]
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %9, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !22
  %66 = fcmp contract ule float %65, %27
  %67 = select i1 %66, i1 true, i1 %41
  br i1 %67, label %243, label %68

68:                                               ; preds = %61
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !10, !amdgpu.noclobber !8
  %73 = load i16, i16 addrspace(4)* %45, align 2, !range !21, !invariant.load !8
  %74 = zext i16 %73 to i32
  br label %75

75:                                               ; preds = %68, %230
  %76 = phi i32 [ %40, %68 ], [ %241, %230 ]
  br i1 %42, label %77, label %230

77:                                               ; preds = %75
  %78 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !10, !amdgpu.noclobber !8
  br i1 %58, label %205, label %79

79:                                               ; preds = %77, %79
  %80 = phi float [ %201, %79 ], [ 0.000000e+00, %77 ]
  %81 = phi i32 [ %202, %79 ], [ 0, %77 ]
  %82 = phi i32 [ %203, %79 ], [ 0, %77 ]
  %83 = mul i32 %81, %21
  %84 = add i32 %78, %83
  %85 = mul i32 %84, %15
  %86 = add i32 %85, %28
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %6, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !22
  %90 = mul i32 %84, %18
  %91 = add i32 %90, %76
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %7, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !22
  %95 = fmul contract float %89, %94
  %96 = fadd contract float %80, %95
  %97 = or i32 %81, 1
  %98 = mul i32 %97, %21
  %99 = add i32 %78, %98
  %100 = mul i32 %99, %15
  %101 = add i32 %100, %28
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %6, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !22
  %105 = mul i32 %99, %18
  %106 = add i32 %105, %76
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %7, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !22
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %96, %110
  %112 = or i32 %81, 2
  %113 = mul i32 %112, %21
  %114 = add i32 %78, %113
  %115 = mul i32 %114, %15
  %116 = add i32 %115, %28
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %6, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !22
  %120 = mul i32 %114, %18
  %121 = add i32 %120, %76
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %7, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !22
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %111, %125
  %127 = or i32 %81, 3
  %128 = mul i32 %127, %21
  %129 = add i32 %78, %128
  %130 = mul i32 %129, %15
  %131 = add i32 %130, %28
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %6, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !22
  %135 = mul i32 %129, %18
  %136 = add i32 %135, %76
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %7, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !22
  %140 = fmul contract float %134, %139
  %141 = fadd contract float %126, %140
  %142 = or i32 %81, 4
  %143 = mul i32 %142, %21
  %144 = add i32 %78, %143
  %145 = mul i32 %144, %15
  %146 = add i32 %145, %28
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %6, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !22
  %150 = mul i32 %144, %18
  %151 = add i32 %150, %76
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %7, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !22
  %155 = fmul contract float %149, %154
  %156 = fadd contract float %141, %155
  %157 = or i32 %81, 5
  %158 = mul i32 %157, %21
  %159 = add i32 %78, %158
  %160 = mul i32 %159, %15
  %161 = add i32 %160, %28
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %6, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !22
  %165 = mul i32 %159, %18
  %166 = add i32 %165, %76
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %7, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !22
  %170 = fmul contract float %164, %169
  %171 = fadd contract float %156, %170
  %172 = or i32 %81, 6
  %173 = mul i32 %172, %21
  %174 = add i32 %78, %173
  %175 = mul i32 %174, %15
  %176 = add i32 %175, %28
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %6, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !22
  %180 = mul i32 %174, %18
  %181 = add i32 %180, %76
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %7, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !22
  %185 = fmul contract float %179, %184
  %186 = fadd contract float %171, %185
  %187 = or i32 %81, 7
  %188 = mul i32 %187, %21
  %189 = add i32 %78, %188
  %190 = mul i32 %189, %15
  %191 = add i32 %190, %28
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %6, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !22
  %195 = mul i32 %189, %18
  %196 = add i32 %195, %76
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %7, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !22
  %200 = fmul contract float %194, %199
  %201 = fadd contract float %186, %200
  %202 = add nuw nsw i32 %81, 8
  %203 = add i32 %82, 8
  %204 = icmp eq i32 %203, %59
  br i1 %204, label %205, label %79, !llvm.loop !24

205:                                              ; preds = %79, %77
  %206 = phi float [ undef, %77 ], [ %201, %79 ]
  %207 = phi float [ 0.000000e+00, %77 ], [ %201, %79 ]
  %208 = phi i32 [ 0, %77 ], [ %202, %79 ]
  br i1 %60, label %230, label %209

209:                                              ; preds = %205, %209
  %210 = phi float [ %226, %209 ], [ %207, %205 ]
  %211 = phi i32 [ %227, %209 ], [ %208, %205 ]
  %212 = phi i32 [ %228, %209 ], [ 0, %205 ]
  %213 = mul i32 %211, %21
  %214 = add i32 %78, %213
  %215 = mul i32 %214, %15
  %216 = add i32 %215, %28
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %6, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !22
  %220 = mul i32 %214, %18
  %221 = add i32 %220, %76
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %7, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !22
  %225 = fmul contract float %219, %224
  %226 = fadd contract float %210, %225
  %227 = add nuw nsw i32 %211, 1
  %228 = add i32 %212, 1
  %229 = icmp eq i32 %228, %57
  br i1 %229, label %230, label %209, !llvm.loop !26

230:                                              ; preds = %205, %209, %75
  %231 = phi float [ 0.000000e+00, %75 ], [ %206, %205 ], [ %226, %209 ]
  %232 = load float, float addrspace(1)* %70, align 4, !tbaa !22
  %233 = fmul contract float %231, %232
  %234 = mul nsw i32 %76, %12
  %235 = add i32 %234, %28
  %236 = add i32 %235, %72
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %5, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !22
  %240 = fadd contract float %233, %239
  store float %240, float addrspace(1)* %238, align 4, !tbaa !22
  %241 = add i32 %76, %74
  %242 = icmp slt i32 %241, %18
  br i1 %242, label %75, label %243, !llvm.loop !28

243:                                              ; preds = %230, %61
  %244 = add i32 %53, %62
  %245 = add i32 %244, %56
  %246 = icmp slt i32 %245, %37
  br i1 %246, label %61, label %247, !llvm.loop !29

247:                                              ; preds = %243, %10
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !17, i64 12}
!13 = !{!"hsa_kernel_dispatch_packet_s", !14, i64 0, !14, i64 2, !14, i64 4, !14, i64 6, !14, i64 8, !14, i64 10, !17, i64 12, !17, i64 16, !17, i64 20, !17, i64 24, !17, i64 28, !18, i64 32, !19, i64 40, !18, i64 48, !20, i64 56}
!14 = !{!"short", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!"int", !15, i64 0}
!18 = !{!"long", !15, i64 0}
!19 = !{!"any pointer", !15, i64 0}
!20 = !{!"hsa_signal_s", !18, i64 0}
!21 = !{i16 1, i16 1025}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !6, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
!28 = distinct !{!28, !25}
!29 = distinct !{!29, !25}
