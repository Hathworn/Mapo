; ModuleID = '../data/hip_kernels/6565/9/main.cu'
source_filename = "../data/hip_kernels/6565/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19calcDenseForwardGPUPfS_S_S_iiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !4
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %12
  %29 = mul i32 %28, %21
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %8, %4
  %33 = mul nsw i32 %32, %9
  %34 = mul nsw i32 %33, %10
  %35 = icmp slt i32 %31, %34
  br i1 %35, label %36, label %200

36:                                               ; preds = %11
  %37 = freeze i32 %31
  %38 = freeze i32 %8
  %39 = sdiv i32 %37, %38
  %40 = mul i32 %39, %38
  %41 = sub i32 %37, %40
  %42 = mul nsw i32 %6, %5
  %43 = mul nsw i32 %42, %7
  %44 = icmp sgt i32 %7, 0
  br i1 %44, label %45, label %61

45:                                               ; preds = %36
  %46 = sdiv i32 %39, %9
  %47 = sdiv i32 %46, %10
  %48 = icmp sgt i32 %6, 0
  %49 = icmp sgt i32 %5, 0
  %50 = mul nsw i32 %41, %43
  %51 = mul nsw i32 %47, %43
  %52 = and i32 %5, 7
  %53 = icmp ult i32 %5, 8
  %54 = and i32 %5, -8
  %55 = icmp eq i32 %52, 0
  br label %56

56:                                               ; preds = %45, %77
  %57 = phi float [ 0.000000e+00, %45 ], [ %78, %77 ]
  %58 = phi i32 [ 0, %45 ], [ %79, %77 ]
  br i1 %48, label %59, label %77

59:                                               ; preds = %56
  %60 = mul nsw i32 %58, %42
  br label %69

61:                                               ; preds = %77, %36
  %62 = phi float [ 0.000000e+00, %36 ], [ %78, %77 ]
  %63 = sext i32 %41 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !14
  %66 = fadd contract float %62, %65
  %67 = sext i32 %31 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  store float %66, float addrspace(1)* %68, align 4, !tbaa !16
  br label %200

69:                                               ; preds = %59, %102
  %70 = phi float [ %57, %59 ], [ %103, %102 ]
  %71 = phi i32 [ 0, %59 ], [ %104, %102 ]
  br i1 %49, label %72, label %102

72:                                               ; preds = %69
  %73 = mul nsw i32 %71, %5
  %74 = add i32 %73, %60
  %75 = add i32 %74, %50
  %76 = add i32 %74, %51
  br i1 %53, label %81, label %106

77:                                               ; preds = %102, %56
  %78 = phi float [ %57, %56 ], [ %103, %102 ]
  %79 = add nuw nsw i32 %58, 1
  %80 = icmp eq i32 %79, %7
  br i1 %80, label %61, label %56, !llvm.loop !20

81:                                               ; preds = %106, %72
  %82 = phi float [ undef, %72 ], [ %196, %106 ]
  %83 = phi float [ %70, %72 ], [ %196, %106 ]
  %84 = phi i32 [ 0, %72 ], [ %197, %106 ]
  br i1 %55, label %102, label %85

85:                                               ; preds = %81, %85
  %86 = phi float [ %98, %85 ], [ %83, %81 ]
  %87 = phi i32 [ %99, %85 ], [ %84, %81 ]
  %88 = phi i32 [ %100, %85 ], [ 0, %81 ]
  %89 = add i32 %75, %87
  %90 = add i32 %76, %87
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16, !amdgpu.noclobber !14
  %94 = sext i32 %89 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !14
  %97 = fmul contract float %93, %96
  %98 = fadd contract float %86, %97
  %99 = add nuw nsw i32 %87, 1
  %100 = add i32 %88, 1
  %101 = icmp eq i32 %100, %52
  br i1 %101, label %102, label %85, !llvm.loop !22

102:                                              ; preds = %81, %85, %69
  %103 = phi float [ %70, %69 ], [ %82, %81 ], [ %98, %85 ]
  %104 = add nuw nsw i32 %71, 1
  %105 = icmp eq i32 %104, %6
  br i1 %105, label %77, label %69, !llvm.loop !24

106:                                              ; preds = %72, %106
  %107 = phi float [ %196, %106 ], [ %70, %72 ]
  %108 = phi i32 [ %197, %106 ], [ 0, %72 ]
  %109 = phi i32 [ %198, %106 ], [ 0, %72 ]
  %110 = add i32 %75, %108
  %111 = add i32 %76, %108
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !14
  %115 = sext i32 %110 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !14
  %118 = fmul contract float %114, %117
  %119 = fadd contract float %107, %118
  %120 = or i32 %108, 1
  %121 = add i32 %75, %120
  %122 = add i32 %76, %120
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !14
  %126 = sext i32 %121 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16, !amdgpu.noclobber !14
  %129 = fmul contract float %125, %128
  %130 = fadd contract float %119, %129
  %131 = or i32 %108, 2
  %132 = add i32 %75, %131
  %133 = add i32 %76, %131
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16, !amdgpu.noclobber !14
  %137 = sext i32 %132 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %2, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16, !amdgpu.noclobber !14
  %140 = fmul contract float %136, %139
  %141 = fadd contract float %130, %140
  %142 = or i32 %108, 3
  %143 = add i32 %75, %142
  %144 = add i32 %76, %142
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16, !amdgpu.noclobber !14
  %148 = sext i32 %143 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16, !amdgpu.noclobber !14
  %151 = fmul contract float %147, %150
  %152 = fadd contract float %141, %151
  %153 = or i32 %108, 4
  %154 = add i32 %75, %153
  %155 = add i32 %76, %153
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !16, !amdgpu.noclobber !14
  %159 = sext i32 %154 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16, !amdgpu.noclobber !14
  %162 = fmul contract float %158, %161
  %163 = fadd contract float %152, %162
  %164 = or i32 %108, 5
  %165 = add i32 %75, %164
  %166 = add i32 %76, %164
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !16, !amdgpu.noclobber !14
  %170 = sext i32 %165 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %2, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !16, !amdgpu.noclobber !14
  %173 = fmul contract float %169, %172
  %174 = fadd contract float %163, %173
  %175 = or i32 %108, 6
  %176 = add i32 %75, %175
  %177 = add i32 %76, %175
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !16, !amdgpu.noclobber !14
  %181 = sext i32 %176 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %2, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !16, !amdgpu.noclobber !14
  %184 = fmul contract float %180, %183
  %185 = fadd contract float %174, %184
  %186 = or i32 %108, 7
  %187 = add i32 %75, %186
  %188 = add i32 %76, %186
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !16, !amdgpu.noclobber !14
  %192 = sext i32 %187 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %2, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !16, !amdgpu.noclobber !14
  %195 = fmul contract float %191, %194
  %196 = fadd contract float %185, %195
  %197 = add nuw nsw i32 %108, 8
  %198 = add i32 %109, 8
  %199 = icmp eq i32 %198, %54
  br i1 %199, label %81, label %106, !llvm.loop !25

200:                                              ; preds = %61, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
