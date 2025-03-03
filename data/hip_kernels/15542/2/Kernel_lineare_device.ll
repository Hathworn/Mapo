; ModuleID = '../data/hip_kernels/15542/2/main.cu'
source_filename = "../data/hip_kernels/15542/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14Kernel_linearePfS_iiiPiS0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 16
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 8, !tbaa !16
  %29 = icmp slt i32 %21, %2
  br i1 %29, label %30, label %232

30:                                               ; preds = %9
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = mul i32 %31, %25
  %33 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %34 = add i32 %32, %33
  %35 = udiv i32 %18, %15
  %36 = mul i32 %35, %15
  %37 = icmp ugt i32 %18, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %15
  br label %41

41:                                               ; preds = %30, %228
  %42 = phi i32 [ %21, %30 ], [ %230, %228 ]
  %43 = phi i32 [ %34, %30 ], [ %229, %228 ]
  %44 = icmp slt i32 %43, %4
  br i1 %44, label %45, label %228

45:                                               ; preds = %41
  %46 = sext i32 %42 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !17, !amdgpu.noclobber !5
  %49 = icmp sgt i32 %48, 0
  %50 = mul nsw i32 %42, %8
  %51 = mul nsw i32 %42, %3
  %52 = udiv i32 %28, %25
  %53 = mul i32 %52, %25
  %54 = icmp ugt i32 %28, %53
  %55 = zext i1 %54 to i32
  %56 = add i32 %52, %55
  %57 = mul i32 %56, %25
  %58 = and i32 %48, 7
  %59 = icmp ult i32 %48, 8
  %60 = and i32 %48, -8
  %61 = icmp eq i32 %58, 0
  br label %62

62:                                               ; preds = %45, %220
  %63 = phi i32 [ %43, %45 ], [ %226, %220 ]
  br i1 %49, label %64, label %220

64:                                               ; preds = %62
  %65 = sext i32 %63 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !17, !amdgpu.noclobber !5
  %68 = mul nsw i32 %67, %3
  br i1 %59, label %195, label %69

69:                                               ; preds = %64, %69
  %70 = phi float [ %191, %69 ], [ 0.000000e+00, %64 ]
  %71 = phi i32 [ %192, %69 ], [ 0, %64 ]
  %72 = phi i32 [ %193, %69 ], [ 0, %64 ]
  %73 = add nsw i32 %71, %50
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !17, !amdgpu.noclobber !5
  %77 = add nsw i32 %76, %51
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !21
  %81 = add nsw i32 %76, %68
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !21
  %85 = fmul contract float %80, %84
  %86 = fadd contract float %70, %85
  %87 = or i32 %71, 1
  %88 = add nsw i32 %87, %50
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !17, !amdgpu.noclobber !5
  %92 = add nsw i32 %91, %51
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !21
  %96 = add nsw i32 %91, %68
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !21
  %100 = fmul contract float %95, %99
  %101 = fadd contract float %86, %100
  %102 = or i32 %71, 2
  %103 = add nsw i32 %102, %50
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !17, !amdgpu.noclobber !5
  %107 = add nsw i32 %106, %51
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !21
  %111 = add nsw i32 %106, %68
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !21
  %115 = fmul contract float %110, %114
  %116 = fadd contract float %101, %115
  %117 = or i32 %71, 3
  %118 = add nsw i32 %117, %50
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !17, !amdgpu.noclobber !5
  %122 = add nsw i32 %121, %51
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !21
  %126 = add nsw i32 %121, %68
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !21
  %130 = fmul contract float %125, %129
  %131 = fadd contract float %116, %130
  %132 = or i32 %71, 4
  %133 = add nsw i32 %132, %50
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !17, !amdgpu.noclobber !5
  %137 = add nsw i32 %136, %51
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %0, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !21
  %141 = add nsw i32 %136, %68
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !21
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %131, %145
  %147 = or i32 %71, 5
  %148 = add nsw i32 %147, %50
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %149
  %151 = load i32, i32 addrspace(1)* %150, align 4, !tbaa !17, !amdgpu.noclobber !5
  %152 = add nsw i32 %151, %51
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !21
  %156 = add nsw i32 %151, %68
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !21
  %160 = fmul contract float %155, %159
  %161 = fadd contract float %146, %160
  %162 = or i32 %71, 6
  %163 = add nsw i32 %162, %50
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %164
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !17, !amdgpu.noclobber !5
  %167 = add nsw i32 %166, %51
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !21
  %171 = add nsw i32 %166, %68
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !21
  %175 = fmul contract float %170, %174
  %176 = fadd contract float %161, %175
  %177 = or i32 %71, 7
  %178 = add nsw i32 %177, %50
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %179
  %181 = load i32, i32 addrspace(1)* %180, align 4, !tbaa !17, !amdgpu.noclobber !5
  %182 = add nsw i32 %181, %51
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !21
  %186 = add nsw i32 %181, %68
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !21
  %190 = fmul contract float %185, %189
  %191 = fadd contract float %176, %190
  %192 = add nuw nsw i32 %71, 8
  %193 = add i32 %72, 8
  %194 = icmp eq i32 %193, %60
  br i1 %194, label %195, label %69, !llvm.loop !23

195:                                              ; preds = %69, %64
  %196 = phi float [ undef, %64 ], [ %191, %69 ]
  %197 = phi float [ 0.000000e+00, %64 ], [ %191, %69 ]
  %198 = phi i32 [ 0, %64 ], [ %192, %69 ]
  br i1 %61, label %220, label %199

199:                                              ; preds = %195, %199
  %200 = phi float [ %216, %199 ], [ %197, %195 ]
  %201 = phi i32 [ %217, %199 ], [ %198, %195 ]
  %202 = phi i32 [ %218, %199 ], [ 0, %195 ]
  %203 = add nsw i32 %201, %50
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %204
  %206 = load i32, i32 addrspace(1)* %205, align 4, !tbaa !17, !amdgpu.noclobber !5
  %207 = add nsw i32 %206, %51
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %0, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !21
  %211 = add nsw i32 %206, %68
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !21
  %215 = fmul contract float %210, %214
  %216 = fadd contract float %200, %215
  %217 = add nuw nsw i32 %201, 1
  %218 = add i32 %202, 1
  %219 = icmp eq i32 %218, %58
  br i1 %219, label %220, label %199, !llvm.loop !25

220:                                              ; preds = %195, %199, %62
  %221 = phi float [ 0.000000e+00, %62 ], [ %196, %195 ], [ %216, %199 ]
  %222 = mul nsw i32 %63, %2
  %223 = add nsw i32 %222, %42
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %224
  store float %221, float addrspace(1)* %225, align 4, !tbaa !21
  %226 = add i32 %57, %63
  %227 = icmp slt i32 %226, %4
  br i1 %227, label %62, label %228, !llvm.loop !27

228:                                              ; preds = %220, %41
  %229 = phi i32 [ %43, %41 ], [ %226, %220 ]
  %230 = add i32 %40, %42
  %231 = icmp slt i32 %230, %2
  br i1 %231, label %41, label %232, !llvm.loop !28

232:                                              ; preds = %228, %9
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
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.unroll.disable"}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !24}
