; ModuleID = '../data/hip_kernels/16873/0/main.cu'
source_filename = "../data/hip_kernels/16873/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4calcPfS_iiE13cached_points = internal unnamed_addr addrspace(3) global [1280 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4calcPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = udiv i32 %13, %10
  %18 = mul i32 %17, %10
  %19 = icmp ugt i32 %13, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = icmp slt i32 %16, %3
  br i1 %22, label %23, label %194

23:                                               ; preds = %4
  %24 = mul nsw i32 %16, 10
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16, !amdgpu.noclobber !5
  %28 = or i32 %24, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !5
  %32 = add nsw i32 %24, 2
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !5
  %36 = add nsw i32 %24, 3
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !5
  %40 = add nsw i32 %24, 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !5
  %44 = add nsw i32 %24, 5
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !5
  %48 = add nsw i32 %24, 6
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16, !amdgpu.noclobber !5
  %52 = add nsw i32 %24, 7
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !5
  %56 = add nsw i32 %24, 8
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !5
  %60 = add nsw i32 %24, 9
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !5
  %64 = icmp sgt i32 %21, 0
  br i1 %64, label %65, label %194

65:                                               ; preds = %23
  %66 = mul nuw nsw i32 %15, 10
  %67 = getelementptr inbounds [1280 x float], [1280 x float] addrspace(3)* @_ZZ4calcPfS_iiE13cached_points, i32 0, i32 %66
  %68 = fpext float %39 to double
  %69 = fmul contract double %68, 6.674000e-11
  %70 = sitofp i32 %2 to float
  %71 = fmul contract float %43, %70
  %72 = fadd contract float %27, %71
  %73 = fmul contract float %70, %70
  %74 = fmul contract float %73, %55
  %75 = fmul contract float %74, 5.000000e-01
  %76 = fadd contract float %72, %75
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %78 = fmul contract float %47, %70
  %79 = fadd contract float %31, %78
  %80 = fmul contract float %73, %59
  %81 = fmul contract float %80, 5.000000e-01
  %82 = fadd contract float %79, %81
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %84 = fmul contract float %51, %70
  %85 = fadd contract float %35, %84
  %86 = fmul contract float %73, %63
  %87 = fmul contract float %86, 5.000000e-01
  %88 = fadd contract float %85, %87
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %91 = fmul contract float %55, %70
  %92 = fadd contract float %43, %91
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %94 = fmul contract float %59, %70
  %95 = fadd contract float %47, %94
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %97 = fmul contract float %63, %70
  %98 = fadd contract float %51, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  br label %103

103:                                              ; preds = %65, %115
  %104 = phi i32 [ 0, %65 ], [ %119, %115 ]
  %105 = shl nsw i32 %104, 7
  %106 = add nuw nsw i32 %105, %15
  %107 = icmp slt i32 %106, %3
  br i1 %107, label %108, label %114

108:                                              ; preds = %103
  %109 = mul nsw i32 %106, 10
  %110 = add nuw nsw i32 %109, 9
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  store float %113, float addrspace(3)* %67, align 8, !tbaa !16
  br label %114

114:                                              ; preds = %108, %103
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %121

115:                                              ; preds = %188
  store float %76, float addrspace(1)* %77, align 4, !tbaa !16
  store float %82, float addrspace(1)* %83, align 4, !tbaa !16
  store float %88, float addrspace(1)* %89, align 4, !tbaa !16
  store float %39, float addrspace(1)* %90, align 4, !tbaa !16
  store float %92, float addrspace(1)* %93, align 4, !tbaa !16
  store float %95, float addrspace(1)* %96, align 4, !tbaa !16
  store float %98, float addrspace(1)* %99, align 4, !tbaa !16
  %116 = fdiv contract float %191, %39
  store float %116, float addrspace(1)* %100, align 4, !tbaa !16
  %117 = fdiv contract float %190, %39
  store float %117, float addrspace(1)* %101, align 4, !tbaa !16
  %118 = fdiv contract float %189, %39
  store float %118, float addrspace(1)* %102, align 4, !tbaa !16
  %119 = add nuw nsw i32 %104, 1
  %120 = icmp eq i32 %119, %21
  br i1 %120, label %194, label %103, !llvm.loop !20

121:                                              ; preds = %114, %188
  %122 = phi float [ 0.000000e+00, %114 ], [ %191, %188 ]
  %123 = phi float [ 0.000000e+00, %114 ], [ %190, %188 ]
  %124 = phi float [ 0.000000e+00, %114 ], [ %189, %188 ]
  %125 = phi i32 [ 0, %114 ], [ %192, %188 ]
  %126 = add nuw nsw i32 %125, %105
  %127 = icmp sge i32 %126, %3
  %128 = icmp eq i32 %126, %16
  %129 = select i1 %127, i1 true, i1 %128
  br i1 %129, label %188, label %130

130:                                              ; preds = %121
  %131 = mul nuw nsw i32 %125, 10
  %132 = getelementptr inbounds [1280 x float], [1280 x float] addrspace(3)* @_ZZ4calcPfS_iiE13cached_points, i32 0, i32 %131
  %133 = load float, float addrspace(3)* %132, align 8, !tbaa !16
  %134 = fsub contract float %133, %27
  %135 = or i32 %131, 1
  %136 = getelementptr inbounds [1280 x float], [1280 x float] addrspace(3)* @_ZZ4calcPfS_iiE13cached_points, i32 0, i32 %135
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !16
  %138 = fsub contract float %137, %31
  %139 = add nuw nsw i32 %131, 2
  %140 = getelementptr inbounds [1280 x float], [1280 x float] addrspace(3)* @_ZZ4calcPfS_iiE13cached_points, i32 0, i32 %139
  %141 = load float, float addrspace(3)* %140, align 8, !tbaa !16
  %142 = fsub contract float %141, %35
  %143 = fmul contract float %134, %134
  %144 = fmul contract float %138, %138
  %145 = fadd contract float %143, %144
  %146 = fmul contract float %142, %142
  %147 = fadd contract float %145, %146
  %148 = fcmp olt float %147, 0x39F0000000000000
  %149 = select i1 %148, float 0x41F0000000000000, float 1.000000e+00
  %150 = fmul float %147, %149
  %151 = tail call float @llvm.sqrt.f32(float %150)
  %152 = bitcast float %151 to i32
  %153 = add nsw i32 %152, -1
  %154 = bitcast i32 %153 to float
  %155 = add nsw i32 %152, 1
  %156 = bitcast i32 %155 to float
  %157 = tail call i1 @llvm.amdgcn.class.f32(float %150, i32 608)
  %158 = select i1 %148, float 0x3EF0000000000000, float 1.000000e+00
  %159 = fneg float %156
  %160 = tail call float @llvm.fma.f32(float %159, float %151, float %150)
  %161 = fcmp ogt float %160, 0.000000e+00
  %162 = fneg float %154
  %163 = tail call float @llvm.fma.f32(float %162, float %151, float %150)
  %164 = fcmp ole float %163, 0.000000e+00
  %165 = select i1 %164, float %154, float %151
  %166 = select i1 %161, float %156, float %165
  %167 = fmul float %158, %166
  %168 = select i1 %157, float %150, float %167
  %169 = add nuw nsw i32 %131, 3
  %170 = getelementptr inbounds [1280 x float], [1280 x float] addrspace(3)* @_ZZ4calcPfS_iiE13cached_points, i32 0, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !16
  %172 = fpext float %171 to double
  %173 = fmul contract double %69, %172
  %174 = fmul contract float %168, %168
  %175 = fadd contract float %174, 0x3EB0C6F7C0000000
  %176 = fpext float %175 to double
  %177 = fdiv contract double %173, %176
  %178 = fptrunc double %177 to float
  %179 = fmul contract float %134, %178
  %180 = fdiv contract float %179, %168
  %181 = fadd contract float %122, %180
  %182 = fmul contract float %138, %178
  %183 = fdiv contract float %182, %168
  %184 = fadd contract float %123, %183
  %185 = fmul contract float %142, %178
  %186 = fdiv contract float %185, %168
  %187 = fadd contract float %124, %186
  br label %188

188:                                              ; preds = %130, %121
  %189 = phi float [ %187, %130 ], [ %124, %121 ]
  %190 = phi float [ %184, %130 ], [ %123, %121 ]
  %191 = phi float [ %181, %130 ], [ %122, %121 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %192 = add nuw nsw i32 %125, 1
  %193 = icmp eq i32 %192, 128
  br i1 %193, label %115, label %121, !llvm.loop !22

194:                                              ; preds = %115, %23, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
