; ModuleID = '../data/hip_kernels/899/6/main.cu'
source_filename = "../data/hip_kernels/899/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture %8, double addrspace(1)* nocapture %9, double addrspace(1)* nocapture %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul nsw i32 %13, %0
  %15 = icmp slt i32 %0, -126
  br i1 %15, label %61, label %16

16:                                               ; preds = %11
  %17 = add nsw i32 %0, -1
  %18 = sdiv i32 %17, 128
  %19 = add nsw i32 %18, 1
  %20 = and i32 %19, 1
  %21 = add i32 %0, 126
  %22 = icmp ult i32 %21, 255
  br i1 %22, label %27, label %23

23:                                               ; preds = %16
  %24 = and i32 %19, -2
  br label %77

25:                                               ; preds = %138
  %26 = shl nsw i32 %142, 7
  br label %27

27:                                               ; preds = %25, %16
  %28 = phi double [ undef, %16 ], [ %139, %25 ]
  %29 = phi double [ undef, %16 ], [ %140, %25 ]
  %30 = phi double [ undef, %16 ], [ %141, %25 ]
  %31 = phi double [ 0.000000e+00, %16 ], [ %141, %25 ]
  %32 = phi i32 [ 0, %16 ], [ %26, %25 ]
  %33 = phi double [ 0.000000e+00, %16 ], [ %140, %25 ]
  %34 = phi double [ 0.000000e+00, %16 ], [ %139, %25 ]
  %35 = icmp eq i32 %20, 0
  br i1 %35, label %61, label %36

36:                                               ; preds = %27
  %37 = add nuw nsw i32 %32, %12
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %39, label %61

39:                                               ; preds = %36
  %40 = zext i32 %37 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !5, !amdgpu.noclobber !9
  %43 = add nsw i32 %37, %14
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %5, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !5, !amdgpu.noclobber !9
  %47 = fmul contract double %42, %46
  %48 = fadd contract double %31, %47
  %49 = getelementptr inbounds double, double addrspace(1)* %3, i64 %40
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !5, !amdgpu.noclobber !9
  %51 = getelementptr inbounds double, double addrspace(1)* %6, i64 %44
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !5, !amdgpu.noclobber !9
  %53 = fmul contract double %50, %52
  %54 = fadd contract double %34, %53
  %55 = getelementptr inbounds double, double addrspace(1)* %4, i64 %40
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !5, !amdgpu.noclobber !9
  %57 = getelementptr inbounds double, double addrspace(1)* %7, i64 %44
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !5, !amdgpu.noclobber !9
  %59 = fmul contract double %56, %58
  %60 = fadd contract double %33, %59
  br label %61

61:                                               ; preds = %27, %39, %36, %11
  %62 = phi double [ 0.000000e+00, %11 ], [ %28, %27 ], [ %54, %39 ], [ %34, %36 ]
  %63 = phi double [ 0.000000e+00, %11 ], [ %29, %27 ], [ %60, %39 ], [ %33, %36 ]
  %64 = phi double [ 0.000000e+00, %11 ], [ %30, %27 ], [ %48, %39 ], [ %31, %36 ]
  %65 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x, i32 0, i32 %12
  store double %64, double addrspace(3)* %65, align 8, !tbaa !5
  %66 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y, i32 0, i32 %12
  store double %62, double addrspace(3)* %66, align 8, !tbaa !5
  %67 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z, i32 0, i32 %12
  store double %63, double addrspace(3)* %67, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %69 = getelementptr i8, i8 addrspace(4)* %68, i64 4
  %70 = bitcast i8 addrspace(4)* %69 to i16 addrspace(4)*
  %71 = load i16, i16 addrspace(4)* %70, align 4, !range !10, !invariant.load !9
  %72 = zext i16 %71 to i32
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %68, i64 12
  %74 = bitcast i8 addrspace(4)* %73 to i32 addrspace(4)*
  %75 = load i32, i32 addrspace(4)* %74, align 4, !tbaa !11
  %76 = icmp ult i16 %71, 2
  br i1 %76, label %145, label %147

77:                                               ; preds = %138, %23
  %78 = phi double [ 0.000000e+00, %23 ], [ %141, %138 ]
  %79 = phi i32 [ 0, %23 ], [ %142, %138 ]
  %80 = phi double [ 0.000000e+00, %23 ], [ %140, %138 ]
  %81 = phi double [ 0.000000e+00, %23 ], [ %139, %138 ]
  %82 = phi i32 [ 0, %23 ], [ %143, %138 ]
  %83 = shl nsw i32 %79, 7
  %84 = add nuw nsw i32 %83, %12
  %85 = icmp slt i32 %84, %0
  br i1 %85, label %86, label %108

86:                                               ; preds = %77
  %87 = zext i32 %84 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %2, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !5, !amdgpu.noclobber !9
  %90 = add nsw i32 %84, %14
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %5, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !5, !amdgpu.noclobber !9
  %94 = fmul contract double %89, %93
  %95 = fadd contract double %78, %94
  %96 = getelementptr inbounds double, double addrspace(1)* %3, i64 %87
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !5, !amdgpu.noclobber !9
  %98 = getelementptr inbounds double, double addrspace(1)* %6, i64 %91
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !5, !amdgpu.noclobber !9
  %100 = fmul contract double %97, %99
  %101 = fadd contract double %81, %100
  %102 = getelementptr inbounds double, double addrspace(1)* %4, i64 %87
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !5, !amdgpu.noclobber !9
  %104 = getelementptr inbounds double, double addrspace(1)* %7, i64 %91
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !5, !amdgpu.noclobber !9
  %106 = fmul contract double %103, %105
  %107 = fadd contract double %80, %106
  br label %108

108:                                              ; preds = %86, %77
  %109 = phi double [ %101, %86 ], [ %81, %77 ]
  %110 = phi double [ %107, %86 ], [ %80, %77 ]
  %111 = phi double [ %95, %86 ], [ %78, %77 ]
  %112 = shl i32 %79, 7
  %113 = or i32 %112, 128
  %114 = add nuw nsw i32 %113, %12
  %115 = icmp slt i32 %114, %0
  br i1 %115, label %116, label %138

116:                                              ; preds = %108
  %117 = zext i32 %114 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %2, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !5, !amdgpu.noclobber !9
  %120 = add nsw i32 %114, %14
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %5, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !5, !amdgpu.noclobber !9
  %124 = fmul contract double %119, %123
  %125 = fadd contract double %111, %124
  %126 = getelementptr inbounds double, double addrspace(1)* %3, i64 %117
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !5, !amdgpu.noclobber !9
  %128 = getelementptr inbounds double, double addrspace(1)* %6, i64 %121
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !5, !amdgpu.noclobber !9
  %130 = fmul contract double %127, %129
  %131 = fadd contract double %109, %130
  %132 = getelementptr inbounds double, double addrspace(1)* %4, i64 %117
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !5, !amdgpu.noclobber !9
  %134 = getelementptr inbounds double, double addrspace(1)* %7, i64 %121
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !5, !amdgpu.noclobber !9
  %136 = fmul contract double %133, %135
  %137 = fadd contract double %110, %136
  br label %138

138:                                              ; preds = %116, %108
  %139 = phi double [ %131, %116 ], [ %109, %108 ]
  %140 = phi double [ %137, %116 ], [ %110, %108 ]
  %141 = phi double [ %125, %116 ], [ %111, %108 ]
  %142 = add nuw nsw i32 %79, 2
  %143 = add i32 %82, 2
  %144 = icmp eq i32 %143, %24
  br i1 %144, label %25, label %77, !llvm.loop !20

145:                                              ; preds = %165, %61
  %146 = icmp eq i32 %12, 0
  br i1 %146, label %167, label %195

147:                                              ; preds = %61, %165
  %148 = phi i32 [ %149, %165 ], [ %72, %61 ]
  %149 = lshr i32 %148, 1
  %150 = icmp ult i32 %12, %149
  br i1 %150, label %151, label %165

151:                                              ; preds = %147
  %152 = add nuw nsw i32 %149, %12
  %153 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x, i32 0, i32 %152
  %154 = load double, double addrspace(3)* %153, align 8, !tbaa !5
  %155 = load double, double addrspace(3)* %65, align 8, !tbaa !5
  %156 = fadd contract double %154, %155
  store double %156, double addrspace(3)* %65, align 8, !tbaa !5
  %157 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y, i32 0, i32 %152
  %158 = load double, double addrspace(3)* %157, align 8, !tbaa !5
  %159 = load double, double addrspace(3)* %66, align 8, !tbaa !5
  %160 = fadd contract double %158, %159
  store double %160, double addrspace(3)* %66, align 8, !tbaa !5
  %161 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z, i32 0, i32 %152
  %162 = load double, double addrspace(3)* %161, align 8, !tbaa !5
  %163 = load double, double addrspace(3)* %67, align 8, !tbaa !5
  %164 = fadd contract double %162, %163
  store double %164, double addrspace(3)* %67, align 8, !tbaa !5
  br label %165

165:                                              ; preds = %151, %147
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %166 = icmp ult i32 %148, 4
  br i1 %166, label %145, label %147, !llvm.loop !22

167:                                              ; preds = %145
  %168 = icmp sgt i32 %13, %1
  %169 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_x, i32 0, i32 0), align 16, !tbaa !5
  br i1 %168, label %173, label %170

170:                                              ; preds = %167
  %171 = sub nsw i32 %1, %13
  %172 = sext i32 %171 to i64
  br label %182

173:                                              ; preds = %167
  %174 = udiv i32 %75, %72
  %175 = mul i32 %174, %72
  %176 = icmp ugt i32 %75, %175
  %177 = zext i1 %176 to i32
  %178 = sub i32 %1, %13
  %179 = add i32 %178, %174
  %180 = add i32 %179, %177
  %181 = zext i32 %180 to i64
  br label %182

182:                                              ; preds = %173, %170
  %183 = phi i64 [ %181, %173 ], [ %172, %170 ]
  %184 = getelementptr inbounds double, double addrspace(1)* %8, i64 %183
  %185 = load double, double addrspace(1)* %184, align 8, !tbaa !5
  %186 = fadd contract double %169, %185
  store double %186, double addrspace(1)* %184, align 8, !tbaa !5
  %187 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_y, i32 0, i32 0), align 16, !tbaa !5
  %188 = getelementptr inbounds double, double addrspace(1)* %9, i64 %183
  %189 = load double, double addrspace(1)* %188, align 8, !tbaa !5
  %190 = fadd contract double %187, %189
  store double %190, double addrspace(1)* %188, align 8, !tbaa !5
  %191 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_vaciiPKdS0_S0_S0_S0_S0_PdS1_S1_E7s_vac_z, i32 0, i32 0), align 16, !tbaa !5
  %192 = getelementptr inbounds double, double addrspace(1)* %10, i64 %183
  %193 = load double, double addrspace(1)* %192, align 8, !tbaa !5
  %194 = fadd contract double %191, %193
  store double %194, double addrspace(1)* %192, align 8, !tbaa !5
  br label %195

195:                                              ; preds = %182, %145
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
