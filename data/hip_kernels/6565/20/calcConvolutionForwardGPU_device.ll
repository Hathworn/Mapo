; ModuleID = '../data/hip_kernels/6565/20/main.cu'
source_filename = "../data/hip_kernels/6565/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25calcConvolutionForwardGPUPfS_S_iiiiiiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !4
  %20 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !13, !invariant.load !14
  %23 = zext i16 %22 to i32
  %24 = udiv i32 %19, %23
  %25 = mul i32 %24, %23
  %26 = icmp ugt i32 %19, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %14
  %31 = mul i32 %30, %23
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = add i32 %31, %32
  %34 = mul nsw i32 %7, %6
  %35 = mul nsw i32 %34, %8
  %36 = mul nsw i32 %35, %9
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %215

38:                                               ; preds = %13
  %39 = freeze i32 %33
  %40 = freeze i32 %7
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %40
  %43 = sub i32 %39, %42
  %44 = freeze i32 %8
  %45 = sdiv i32 %41, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %41, %46
  %48 = mul nsw i32 %43, %11
  %49 = mul nsw i32 %47, %11
  %50 = icmp sgt i32 %5, 0
  br i1 %50, label %51, label %71

51:                                               ; preds = %38
  %52 = freeze i32 %9
  %53 = sdiv i32 %45, %52
  %54 = mul i32 %53, %52
  %55 = sub i32 %45, %54
  %56 = icmp sgt i32 %10, 0
  %57 = mul i32 %53, %5
  %58 = mul nsw i32 %55, %12
  %59 = and i32 %10, 7
  %60 = icmp ult i32 %10, 8
  %61 = and i32 %10, -8
  %62 = icmp eq i32 %59, 0
  br label %63

63:                                               ; preds = %51, %83
  %64 = phi float [ 0.000000e+00, %51 ], [ %84, %83 ]
  %65 = phi i32 [ 0, %51 ], [ %85, %83 ]
  br i1 %56, label %66, label %83

66:                                               ; preds = %63
  %67 = add i32 %65, %57
  %68 = mul i32 %67, %4
  %69 = add i32 %68, %49
  %70 = mul i32 %65, %10
  br label %75

71:                                               ; preds = %83, %38
  %72 = phi float [ 0.000000e+00, %38 ], [ %84, %83 ]
  %73 = sext i32 %33 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  store float %72, float addrspace(1)* %74, align 4, !tbaa !16
  br label %215

75:                                               ; preds = %66, %109
  %76 = phi float [ %64, %66 ], [ %110, %109 ]
  %77 = phi i32 [ 0, %66 ], [ %111, %109 ]
  %78 = add i32 %69, %77
  %79 = mul i32 %78, %3
  %80 = add i32 %77, %70
  %81 = mul i32 %80, %10
  %82 = add i32 %81, %58
  br i1 %60, label %87, label %113

83:                                               ; preds = %109, %63
  %84 = phi float [ %64, %63 ], [ %110, %109 ]
  %85 = add nuw nsw i32 %65, 1
  %86 = icmp eq i32 %85, %5
  br i1 %86, label %71, label %63, !llvm.loop !20

87:                                               ; preds = %113, %75
  %88 = phi float [ undef, %75 ], [ %211, %113 ]
  %89 = phi float [ %76, %75 ], [ %211, %113 ]
  %90 = phi i32 [ 0, %75 ], [ %212, %113 ]
  br i1 %62, label %109, label %91

91:                                               ; preds = %87, %91
  %92 = phi float [ %105, %91 ], [ %89, %87 ]
  %93 = phi i32 [ %106, %91 ], [ %90, %87 ]
  %94 = phi i32 [ %107, %91 ], [ 0, %87 ]
  %95 = add i32 %93, %48
  %96 = add i32 %95, %79
  %97 = add i32 %82, %93
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16, !amdgpu.noclobber !14
  %101 = sext i32 %96 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16, !amdgpu.noclobber !14
  %104 = fmul contract float %100, %103
  %105 = fadd contract float %92, %104
  %106 = add nuw nsw i32 %93, 1
  %107 = add i32 %94, 1
  %108 = icmp eq i32 %107, %59
  br i1 %108, label %109, label %91, !llvm.loop !22

109:                                              ; preds = %91, %87
  %110 = phi float [ %88, %87 ], [ %105, %91 ]
  %111 = add nuw nsw i32 %77, 1
  %112 = icmp eq i32 %111, %10
  br i1 %112, label %83, label %75, !llvm.loop !24

113:                                              ; preds = %75, %113
  %114 = phi float [ %211, %113 ], [ %76, %75 ]
  %115 = phi i32 [ %212, %113 ], [ 0, %75 ]
  %116 = phi i32 [ %213, %113 ], [ 0, %75 ]
  %117 = add i32 %115, %48
  %118 = add i32 %117, %79
  %119 = add i32 %82, %115
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16, !amdgpu.noclobber !14
  %123 = sext i32 %118 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !14
  %126 = fmul contract float %122, %125
  %127 = fadd contract float %114, %126
  %128 = or i32 %115, 1
  %129 = add i32 %128, %48
  %130 = add i32 %129, %79
  %131 = add i32 %82, %128
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %2, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16, !amdgpu.noclobber !14
  %135 = sext i32 %130 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16, !amdgpu.noclobber !14
  %138 = fmul contract float %134, %137
  %139 = fadd contract float %127, %138
  %140 = or i32 %115, 2
  %141 = add i32 %140, %48
  %142 = add i32 %141, %79
  %143 = add i32 %82, %140
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16, !amdgpu.noclobber !14
  %147 = sext i32 %142 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16, !amdgpu.noclobber !14
  %150 = fmul contract float %146, %149
  %151 = fadd contract float %139, %150
  %152 = or i32 %115, 3
  %153 = add i32 %152, %48
  %154 = add i32 %153, %79
  %155 = add i32 %82, %152
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !16, !amdgpu.noclobber !14
  %159 = sext i32 %154 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16, !amdgpu.noclobber !14
  %162 = fmul contract float %158, %161
  %163 = fadd contract float %151, %162
  %164 = or i32 %115, 4
  %165 = add i32 %164, %48
  %166 = add i32 %165, %79
  %167 = add i32 %82, %164
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !16, !amdgpu.noclobber !14
  %171 = sext i32 %166 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16, !amdgpu.noclobber !14
  %174 = fmul contract float %170, %173
  %175 = fadd contract float %163, %174
  %176 = or i32 %115, 5
  %177 = add i32 %176, %48
  %178 = add i32 %177, %79
  %179 = add i32 %82, %176
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %2, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !16, !amdgpu.noclobber !14
  %183 = sext i32 %178 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !16, !amdgpu.noclobber !14
  %186 = fmul contract float %182, %185
  %187 = fadd contract float %175, %186
  %188 = or i32 %115, 6
  %189 = add i32 %188, %48
  %190 = add i32 %189, %79
  %191 = add i32 %82, %188
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %2, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !16, !amdgpu.noclobber !14
  %195 = sext i32 %190 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %1, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !16, !amdgpu.noclobber !14
  %198 = fmul contract float %194, %197
  %199 = fadd contract float %187, %198
  %200 = or i32 %115, 7
  %201 = add i32 %200, %48
  %202 = add i32 %201, %79
  %203 = add i32 %82, %200
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %2, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !16, !amdgpu.noclobber !14
  %207 = sext i32 %202 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !16, !amdgpu.noclobber !14
  %210 = fmul contract float %206, %209
  %211 = fadd contract float %199, %210
  %212 = add nuw nsw i32 %115, 8
  %213 = add i32 %116, 8
  %214 = icmp eq i32 %213, %61
  br i1 %214, label %87, label %113, !llvm.loop !25

215:                                              ; preds = %71, %13
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
