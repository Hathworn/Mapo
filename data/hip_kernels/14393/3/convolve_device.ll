; ModuleID = '../data/hip_kernels/14393/3/main.cu'
source_filename = "../data/hip_kernels/14393/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@convolutionKernel = protected addrspace(4) externally_initialized global [256 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([256 x float] addrspace(4)* @convolutionKernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8convolvePhiiiiliiS_(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i64 %5, i32 %6, i32 %7, i8 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
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
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 16
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 8, !tbaa !16
  %30 = mul i32 %22, %26
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = add i32 %30, %31
  %33 = sdiv i32 %6, 2
  %34 = sdiv i32 %7, 2
  %35 = add i32 %33, %3
  %36 = icmp slt i32 %21, %35
  %37 = add i32 %34, %4
  %38 = icmp slt i32 %32, %37
  %39 = select i1 %36, i1 true, i1 %38
  br i1 %39, label %216, label %40

40:                                               ; preds = %9
  %41 = udiv i32 %18, %15
  %42 = mul i32 %41, %15
  %43 = icmp ugt i32 %18, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %41, %44
  %46 = mul i32 %45, %15
  %47 = sub i32 %46, %35
  %48 = icmp ult i32 %21, %47
  br i1 %48, label %49, label %216

49:                                               ; preds = %40
  %50 = udiv i32 %29, %26
  %51 = mul i32 %50, %26
  %52 = icmp ugt i32 %29, %51
  %53 = zext i1 %52 to i32
  %54 = add i32 %50, %53
  %55 = mul i32 %54, %26
  %56 = sub i32 %55, %37
  %57 = icmp uge i32 %32, %56
  %58 = icmp slt i32 %7, -1
  %59 = select i1 %57, i1 true, i1 %58
  br i1 %59, label %216, label %60

60:                                               ; preds = %49
  %61 = sub nsw i32 0, %34
  %62 = sub nsw i32 0, %33
  %63 = icmp slt i32 %6, -1
  %64 = tail call i32 @llvm.abs.i32(i32 %33, i1 true)
  %65 = tail call i32 @llvm.abs.i32(i32 %34, i1 true)
  %66 = add i32 %33, %64
  %67 = add i32 %66, 1
  %68 = and i32 %67, 7
  %69 = icmp eq i32 %68, 0
  %70 = icmp ult i32 %66, 7
  br label %71

71:                                               ; preds = %60, %104
  %72 = phi float [ 0.000000e+00, %60 ], [ %105, %104 ]
  %73 = phi i32 [ %61, %60 ], [ %106, %104 ]
  br i1 %63, label %104, label %74

74:                                               ; preds = %71
  %75 = add nsw i32 %73, %34
  %76 = mul nsw i32 %75, %6
  %77 = add i32 %76, %33
  %78 = add nsw i32 %73, %32
  %79 = mul nsw i32 %78, %1
  %80 = add i32 %79, %21
  br i1 %69, label %100, label %81

81:                                               ; preds = %74, %81
  %82 = phi float [ %96, %81 ], [ %72, %74 ]
  %83 = phi i32 [ %97, %81 ], [ %62, %74 ]
  %84 = phi i32 [ %98, %81 ], [ 0, %74 ]
  %85 = add i32 %77, %83
  %86 = sext i32 %85 to i64
  %87 = add nsw i64 %86, %5
  %88 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %87
  %89 = load float, float addrspace(4)* %88, align 4, !tbaa !17
  %90 = add i32 %80, %83
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !21, !amdgpu.noclobber !5
  %94 = uitofp i8 %93 to float
  %95 = fmul contract float %89, %94
  %96 = fadd contract float %82, %95
  %97 = add i32 %83, 1
  %98 = add i32 %84, 1
  %99 = icmp eq i32 %98, %68
  br i1 %99, label %100, label %81, !llvm.loop !22

100:                                              ; preds = %81, %74
  %101 = phi float [ undef, %74 ], [ %96, %81 ]
  %102 = phi float [ %72, %74 ], [ %96, %81 ]
  %103 = phi i32 [ %62, %74 ], [ %97, %81 ]
  br i1 %70, label %104, label %108

104:                                              ; preds = %100, %108, %71
  %105 = phi float [ %72, %71 ], [ %101, %100 ], [ %213, %108 ]
  %106 = add i32 %73, 1
  %107 = icmp eq i32 %73, %65
  br i1 %107, label %216, label %71, !llvm.loop !24

108:                                              ; preds = %100, %108
  %109 = phi float [ %213, %108 ], [ %102, %100 ]
  %110 = phi i32 [ %214, %108 ], [ %103, %100 ]
  %111 = add i32 %77, %110
  %112 = sext i32 %111 to i64
  %113 = add nsw i64 %112, %5
  %114 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %113
  %115 = load float, float addrspace(4)* %114, align 4, !tbaa !17
  %116 = add i32 %80, %110
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !21, !amdgpu.noclobber !5
  %120 = uitofp i8 %119 to float
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %109, %121
  %123 = add i32 %110, 1
  %124 = add i32 %77, %123
  %125 = sext i32 %124 to i64
  %126 = add nsw i64 %125, %5
  %127 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %126
  %128 = load float, float addrspace(4)* %127, align 4, !tbaa !17
  %129 = add i32 %80, %123
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %130
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !21, !amdgpu.noclobber !5
  %133 = uitofp i8 %132 to float
  %134 = fmul contract float %128, %133
  %135 = fadd contract float %122, %134
  %136 = add i32 %110, 2
  %137 = add i32 %77, %136
  %138 = sext i32 %137 to i64
  %139 = add nsw i64 %138, %5
  %140 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %139
  %141 = load float, float addrspace(4)* %140, align 4, !tbaa !17
  %142 = add i32 %80, %136
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !21, !amdgpu.noclobber !5
  %146 = uitofp i8 %145 to float
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %135, %147
  %149 = add i32 %110, 3
  %150 = add i32 %77, %149
  %151 = sext i32 %150 to i64
  %152 = add nsw i64 %151, %5
  %153 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %152
  %154 = load float, float addrspace(4)* %153, align 4, !tbaa !17
  %155 = add i32 %80, %149
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %156
  %158 = load i8, i8 addrspace(1)* %157, align 1, !tbaa !21, !amdgpu.noclobber !5
  %159 = uitofp i8 %158 to float
  %160 = fmul contract float %154, %159
  %161 = fadd contract float %148, %160
  %162 = add i32 %110, 4
  %163 = add i32 %77, %162
  %164 = sext i32 %163 to i64
  %165 = add nsw i64 %164, %5
  %166 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %165
  %167 = load float, float addrspace(4)* %166, align 4, !tbaa !17
  %168 = add i32 %80, %162
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %169
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !21, !amdgpu.noclobber !5
  %172 = uitofp i8 %171 to float
  %173 = fmul contract float %167, %172
  %174 = fadd contract float %161, %173
  %175 = add i32 %110, 5
  %176 = add i32 %77, %175
  %177 = sext i32 %176 to i64
  %178 = add nsw i64 %177, %5
  %179 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %178
  %180 = load float, float addrspace(4)* %179, align 4, !tbaa !17
  %181 = add i32 %80, %175
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %182
  %184 = load i8, i8 addrspace(1)* %183, align 1, !tbaa !21, !amdgpu.noclobber !5
  %185 = uitofp i8 %184 to float
  %186 = fmul contract float %180, %185
  %187 = fadd contract float %174, %186
  %188 = add i32 %110, 6
  %189 = add i32 %77, %188
  %190 = sext i32 %189 to i64
  %191 = add nsw i64 %190, %5
  %192 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %191
  %193 = load float, float addrspace(4)* %192, align 4, !tbaa !17
  %194 = add i32 %80, %188
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %195
  %197 = load i8, i8 addrspace(1)* %196, align 1, !tbaa !21, !amdgpu.noclobber !5
  %198 = uitofp i8 %197 to float
  %199 = fmul contract float %193, %198
  %200 = fadd contract float %187, %199
  %201 = add i32 %110, 7
  %202 = add i32 %77, %201
  %203 = sext i32 %202 to i64
  %204 = add nsw i64 %203, %5
  %205 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @convolutionKernel, i64 0, i64 %204
  %206 = load float, float addrspace(4)* %205, align 4, !tbaa !17
  %207 = add i32 %80, %201
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %208
  %210 = load i8, i8 addrspace(1)* %209, align 1, !tbaa !21, !amdgpu.noclobber !5
  %211 = uitofp i8 %210 to float
  %212 = fmul contract float %206, %211
  %213 = fadd contract float %200, %212
  %214 = add i32 %110, 8
  %215 = icmp eq i32 %201, %64
  br i1 %215, label %104, label %108, !llvm.loop !26

216:                                              ; preds = %104, %49, %40, %9
  %217 = phi float [ 0.000000e+00, %49 ], [ 0.000000e+00, %40 ], [ 0.000000e+00, %9 ], [ %105, %104 ]
  %218 = fptoui float %217 to i8
  %219 = mul nsw i32 %32, %1
  %220 = add nsw i32 %219, %21
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %221
  store i8 %218, i8 addrspace(1)* %222, align 1, !tbaa !21
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!19, !19, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
