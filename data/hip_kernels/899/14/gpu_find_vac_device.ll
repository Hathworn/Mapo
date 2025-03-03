; ModuleID = '../data/hip_kernels/899/14/main.cu'
source_filename = "../data/hip_kernels/899/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture %9, double addrspace(1)* nocapture %10, double addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul nsw i32 %14, %0
  %16 = icmp slt i32 %0, -126
  br i1 %16, label %67, label %17

17:                                               ; preds = %12
  %18 = add nsw i32 %0, -1
  %19 = sdiv i32 %18, 128
  %20 = add nsw i32 %19, 1
  %21 = and i32 %20, 1
  %22 = add i32 %0, 126
  %23 = icmp ult i32 %22, 255
  br i1 %23, label %28, label %24

24:                                               ; preds = %17
  %25 = and i32 %20, -2
  br label %83

26:                                               ; preds = %154
  %27 = shl nsw i32 %158, 7
  br label %28

28:                                               ; preds = %26, %17
  %29 = phi double [ undef, %17 ], [ %155, %26 ]
  %30 = phi double [ undef, %17 ], [ %156, %26 ]
  %31 = phi double [ undef, %17 ], [ %157, %26 ]
  %32 = phi double [ 0.000000e+00, %17 ], [ %157, %26 ]
  %33 = phi double [ 0.000000e+00, %17 ], [ %156, %26 ]
  %34 = phi i32 [ 0, %17 ], [ %27, %26 ]
  %35 = phi double [ 0.000000e+00, %17 ], [ %155, %26 ]
  %36 = icmp eq i32 %21, 0
  br i1 %36, label %67, label %37

37:                                               ; preds = %28
  %38 = add nuw nsw i32 %34, %13
  %39 = icmp slt i32 %38, %0
  br i1 %39, label %40, label %67

40:                                               ; preds = %37
  %41 = zext i32 %38 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %2, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !5, !amdgpu.noclobber !9
  %44 = getelementptr inbounds double, double addrspace(1)* %3, i64 %41
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !5, !amdgpu.noclobber !9
  %46 = fmul contract double %43, %45
  %47 = add nsw i32 %38, %15
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %6, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !5, !amdgpu.noclobber !9
  %51 = fmul contract double %46, %50
  %52 = fadd contract double %32, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %4, i64 %41
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !5, !amdgpu.noclobber !9
  %55 = fmul contract double %43, %54
  %56 = getelementptr inbounds double, double addrspace(1)* %7, i64 %48
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !5, !amdgpu.noclobber !9
  %58 = fmul contract double %55, %57
  %59 = fadd contract double %33, %58
  %60 = getelementptr inbounds double, double addrspace(1)* %5, i64 %41
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !5, !amdgpu.noclobber !9
  %62 = fmul contract double %43, %61
  %63 = getelementptr inbounds double, double addrspace(1)* %8, i64 %48
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !5, !amdgpu.noclobber !9
  %65 = fmul contract double %62, %64
  %66 = fadd contract double %35, %65
  br label %67

67:                                               ; preds = %28, %40, %37, %12
  %68 = phi double [ 0.000000e+00, %12 ], [ %29, %28 ], [ %66, %40 ], [ %35, %37 ]
  %69 = phi double [ 0.000000e+00, %12 ], [ %30, %28 ], [ %59, %40 ], [ %33, %37 ]
  %70 = phi double [ 0.000000e+00, %12 ], [ %31, %28 ], [ %52, %40 ], [ %32, %37 ]
  %71 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x, i32 0, i32 %13
  store double %70, double addrspace(3)* %71, align 8, !tbaa !5
  %72 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y, i32 0, i32 %13
  store double %69, double addrspace(3)* %72, align 8, !tbaa !5
  %73 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z, i32 0, i32 %13
  store double %68, double addrspace(3)* %73, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %75 = getelementptr i8, i8 addrspace(4)* %74, i64 4
  %76 = bitcast i8 addrspace(4)* %75 to i16 addrspace(4)*
  %77 = load i16, i16 addrspace(4)* %76, align 4, !range !10, !invariant.load !9
  %78 = zext i16 %77 to i32
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %74, i64 12
  %80 = bitcast i8 addrspace(4)* %79 to i32 addrspace(4)*
  %81 = load i32, i32 addrspace(4)* %80, align 4, !tbaa !11
  %82 = icmp ult i16 %77, 2
  br i1 %82, label %161, label %163

83:                                               ; preds = %154, %24
  %84 = phi double [ 0.000000e+00, %24 ], [ %157, %154 ]
  %85 = phi double [ 0.000000e+00, %24 ], [ %156, %154 ]
  %86 = phi i32 [ 0, %24 ], [ %158, %154 ]
  %87 = phi double [ 0.000000e+00, %24 ], [ %155, %154 ]
  %88 = phi i32 [ 0, %24 ], [ %159, %154 ]
  %89 = shl nsw i32 %86, 7
  %90 = add nuw nsw i32 %89, %13
  %91 = icmp slt i32 %90, %0
  br i1 %91, label %92, label %119

92:                                               ; preds = %83
  %93 = zext i32 %90 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %2, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !5, !amdgpu.noclobber !9
  %96 = getelementptr inbounds double, double addrspace(1)* %3, i64 %93
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !5, !amdgpu.noclobber !9
  %98 = fmul contract double %95, %97
  %99 = add nsw i32 %90, %15
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %6, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !5, !amdgpu.noclobber !9
  %103 = fmul contract double %98, %102
  %104 = fadd contract double %84, %103
  %105 = getelementptr inbounds double, double addrspace(1)* %4, i64 %93
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !5, !amdgpu.noclobber !9
  %107 = fmul contract double %95, %106
  %108 = getelementptr inbounds double, double addrspace(1)* %7, i64 %100
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !5, !amdgpu.noclobber !9
  %110 = fmul contract double %107, %109
  %111 = fadd contract double %85, %110
  %112 = getelementptr inbounds double, double addrspace(1)* %5, i64 %93
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !5, !amdgpu.noclobber !9
  %114 = fmul contract double %95, %113
  %115 = getelementptr inbounds double, double addrspace(1)* %8, i64 %100
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !5, !amdgpu.noclobber !9
  %117 = fmul contract double %114, %116
  %118 = fadd contract double %87, %117
  br label %119

119:                                              ; preds = %92, %83
  %120 = phi double [ %118, %92 ], [ %87, %83 ]
  %121 = phi double [ %111, %92 ], [ %85, %83 ]
  %122 = phi double [ %104, %92 ], [ %84, %83 ]
  %123 = shl i32 %86, 7
  %124 = or i32 %123, 128
  %125 = add nuw nsw i32 %124, %13
  %126 = icmp slt i32 %125, %0
  br i1 %126, label %127, label %154

127:                                              ; preds = %119
  %128 = zext i32 %125 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %2, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !5, !amdgpu.noclobber !9
  %131 = getelementptr inbounds double, double addrspace(1)* %3, i64 %128
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !5, !amdgpu.noclobber !9
  %133 = fmul contract double %130, %132
  %134 = add nsw i32 %125, %15
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %6, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !5, !amdgpu.noclobber !9
  %138 = fmul contract double %133, %137
  %139 = fadd contract double %122, %138
  %140 = getelementptr inbounds double, double addrspace(1)* %4, i64 %128
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !5, !amdgpu.noclobber !9
  %142 = fmul contract double %130, %141
  %143 = getelementptr inbounds double, double addrspace(1)* %7, i64 %135
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !5, !amdgpu.noclobber !9
  %145 = fmul contract double %142, %144
  %146 = fadd contract double %121, %145
  %147 = getelementptr inbounds double, double addrspace(1)* %5, i64 %128
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !5, !amdgpu.noclobber !9
  %149 = fmul contract double %130, %148
  %150 = getelementptr inbounds double, double addrspace(1)* %8, i64 %135
  %151 = load double, double addrspace(1)* %150, align 8, !tbaa !5, !amdgpu.noclobber !9
  %152 = fmul contract double %149, %151
  %153 = fadd contract double %120, %152
  br label %154

154:                                              ; preds = %127, %119
  %155 = phi double [ %153, %127 ], [ %120, %119 ]
  %156 = phi double [ %146, %127 ], [ %121, %119 ]
  %157 = phi double [ %139, %127 ], [ %122, %119 ]
  %158 = add nuw nsw i32 %86, 2
  %159 = add i32 %88, 2
  %160 = icmp eq i32 %159, %25
  br i1 %160, label %26, label %83, !llvm.loop !20

161:                                              ; preds = %181, %67
  %162 = icmp eq i32 %13, 0
  br i1 %162, label %183, label %211

163:                                              ; preds = %67, %181
  %164 = phi i32 [ %165, %181 ], [ %78, %67 ]
  %165 = lshr i32 %164, 1
  %166 = icmp ult i32 %13, %165
  br i1 %166, label %167, label %181

167:                                              ; preds = %163
  %168 = add nuw nsw i32 %165, %13
  %169 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x, i32 0, i32 %168
  %170 = load double, double addrspace(3)* %169, align 8, !tbaa !5
  %171 = load double, double addrspace(3)* %71, align 8, !tbaa !5
  %172 = fadd contract double %170, %171
  store double %172, double addrspace(3)* %71, align 8, !tbaa !5
  %173 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y, i32 0, i32 %168
  %174 = load double, double addrspace(3)* %173, align 8, !tbaa !5
  %175 = load double, double addrspace(3)* %72, align 8, !tbaa !5
  %176 = fadd contract double %174, %175
  store double %176, double addrspace(3)* %72, align 8, !tbaa !5
  %177 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z, i32 0, i32 %168
  %178 = load double, double addrspace(3)* %177, align 8, !tbaa !5
  %179 = load double, double addrspace(3)* %73, align 8, !tbaa !5
  %180 = fadd contract double %178, %179
  store double %180, double addrspace(3)* %73, align 8, !tbaa !5
  br label %181

181:                                              ; preds = %167, %163
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %182 = icmp ult i32 %164, 4
  br i1 %182, label %161, label %163, !llvm.loop !22

183:                                              ; preds = %161
  %184 = icmp sgt i32 %14, %1
  %185 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x, i32 0, i32 0), align 16, !tbaa !5
  br i1 %184, label %189, label %186

186:                                              ; preds = %183
  %187 = sub nsw i32 %1, %14
  %188 = sext i32 %187 to i64
  br label %198

189:                                              ; preds = %183
  %190 = udiv i32 %81, %78
  %191 = mul i32 %190, %78
  %192 = icmp ugt i32 %81, %191
  %193 = zext i1 %192 to i32
  %194 = sub i32 %1, %14
  %195 = add i32 %194, %190
  %196 = add i32 %195, %193
  %197 = zext i32 %196 to i64
  br label %198

198:                                              ; preds = %189, %186
  %199 = phi i64 [ %197, %189 ], [ %188, %186 ]
  %200 = getelementptr inbounds double, double addrspace(1)* %9, i64 %199
  %201 = load double, double addrspace(1)* %200, align 8, !tbaa !5
  %202 = fadd contract double %185, %201
  store double %202, double addrspace(1)* %200, align 8, !tbaa !5
  %203 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y, i32 0, i32 0), align 16, !tbaa !5
  %204 = getelementptr inbounds double, double addrspace(1)* %10, i64 %199
  %205 = load double, double addrspace(1)* %204, align 8, !tbaa !5
  %206 = fadd contract double %203, %205
  store double %206, double addrspace(1)* %204, align 8, !tbaa !5
  %207 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z, i32 0, i32 0), align 16, !tbaa !5
  %208 = getelementptr inbounds double, double addrspace(1)* %11, i64 %199
  %209 = load double, double addrspace(1)* %208, align 8, !tbaa !5
  %210 = fadd contract double %207, %209
  store double %210, double addrspace(1)* %208, align 8, !tbaa !5
  br label %211

211:                                              ; preds = %198, %161
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
