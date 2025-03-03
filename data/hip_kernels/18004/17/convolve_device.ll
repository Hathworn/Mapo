; ModuleID = '../data/hip_kernels/18004/17/main.cu'
source_filename = "../data/hip_kernels/18004/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@mask = protected addrspace(4) externally_initialized global [256 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([256 x float] addrspace(4)* @mask to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8convolvePhiiiiiijS_(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i8 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
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
  %33 = sdiv i32 %5, 2
  %34 = sdiv i32 %6, 2
  %35 = add i32 %33, %3
  %36 = icmp slt i32 %21, %35
  %37 = add i32 %34, %4
  %38 = icmp slt i32 %32, %37
  %39 = select i1 %36, i1 true, i1 %38
  br i1 %39, label %208, label %40

40:                                               ; preds = %9
  %41 = udiv i32 %18, %15
  %42 = mul i32 %41, %15
  %43 = icmp ugt i32 %18, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %41, %44
  %46 = mul i32 %45, %15
  %47 = sub i32 %46, %35
  %48 = icmp ult i32 %21, %47
  br i1 %48, label %49, label %208

49:                                               ; preds = %40
  %50 = udiv i32 %29, %26
  %51 = mul i32 %50, %26
  %52 = icmp ugt i32 %29, %51
  %53 = zext i1 %52 to i32
  %54 = add i32 %50, %53
  %55 = mul i32 %54, %26
  %56 = sub i32 %55, %37
  %57 = icmp uge i32 %32, %56
  %58 = icmp slt i32 %6, -1
  %59 = select i1 %57, i1 true, i1 %58
  br i1 %59, label %208, label %60

60:                                               ; preds = %49
  %61 = sub nsw i32 0, %34
  %62 = sub nsw i32 0, %33
  %63 = icmp slt i32 %5, -1
  %64 = add i32 %33, %7
  %65 = tail call i32 @llvm.abs.i32(i32 %33, i1 true)
  %66 = tail call i32 @llvm.abs.i32(i32 %34, i1 true)
  %67 = add i32 %33, %65
  %68 = add i32 %67, 1
  %69 = and i32 %68, 7
  %70 = icmp eq i32 %69, 0
  %71 = icmp ult i32 %67, 7
  br label %72

72:                                               ; preds = %60, %104
  %73 = phi float [ 0.000000e+00, %60 ], [ %105, %104 ]
  %74 = phi i32 [ %61, %60 ], [ %106, %104 ]
  br i1 %63, label %104, label %75

75:                                               ; preds = %72
  %76 = add nsw i32 %74, %34
  %77 = mul nsw i32 %76, %5
  %78 = add i32 %64, %77
  %79 = add nsw i32 %74, %32
  %80 = mul nsw i32 %79, %1
  %81 = add i32 %80, %21
  br i1 %70, label %100, label %82

82:                                               ; preds = %75, %82
  %83 = phi float [ %96, %82 ], [ %73, %75 ]
  %84 = phi i32 [ %97, %82 ], [ %62, %75 ]
  %85 = phi i32 [ %98, %82 ], [ 0, %75 ]
  %86 = add i32 %78, %84
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %87
  %89 = load float, float addrspace(4)* %88, align 4, !tbaa !17
  %90 = add i32 %81, %84
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !21, !amdgpu.noclobber !5
  %94 = uitofp i8 %93 to float
  %95 = fmul contract float %89, %94
  %96 = fadd contract float %83, %95
  %97 = add i32 %84, 1
  %98 = add i32 %85, 1
  %99 = icmp eq i32 %98, %69
  br i1 %99, label %100, label %82, !llvm.loop !22

100:                                              ; preds = %82, %75
  %101 = phi float [ undef, %75 ], [ %96, %82 ]
  %102 = phi float [ %73, %75 ], [ %96, %82 ]
  %103 = phi i32 [ %62, %75 ], [ %97, %82 ]
  br i1 %71, label %104, label %108

104:                                              ; preds = %100, %108, %72
  %105 = phi float [ %73, %72 ], [ %101, %100 ], [ %205, %108 ]
  %106 = add i32 %74, 1
  %107 = icmp eq i32 %74, %66
  br i1 %107, label %208, label %72, !llvm.loop !24

108:                                              ; preds = %100, %108
  %109 = phi float [ %205, %108 ], [ %102, %100 ]
  %110 = phi i32 [ %206, %108 ], [ %103, %100 ]
  %111 = add i32 %78, %110
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %112
  %114 = load float, float addrspace(4)* %113, align 4, !tbaa !17
  %115 = add i32 %81, %110
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %116
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !21, !amdgpu.noclobber !5
  %119 = uitofp i8 %118 to float
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %109, %120
  %122 = add i32 %110, 1
  %123 = add i32 %78, %122
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %124
  %126 = load float, float addrspace(4)* %125, align 4, !tbaa !17
  %127 = add i32 %81, %122
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %128
  %130 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !21, !amdgpu.noclobber !5
  %131 = uitofp i8 %130 to float
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %121, %132
  %134 = add i32 %110, 2
  %135 = add i32 %78, %134
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %136
  %138 = load float, float addrspace(4)* %137, align 4, !tbaa !17
  %139 = add i32 %81, %134
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %140
  %142 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !21, !amdgpu.noclobber !5
  %143 = uitofp i8 %142 to float
  %144 = fmul contract float %138, %143
  %145 = fadd contract float %133, %144
  %146 = add i32 %110, 3
  %147 = add i32 %78, %146
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %148
  %150 = load float, float addrspace(4)* %149, align 4, !tbaa !17
  %151 = add i32 %81, %146
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !21, !amdgpu.noclobber !5
  %155 = uitofp i8 %154 to float
  %156 = fmul contract float %150, %155
  %157 = fadd contract float %145, %156
  %158 = add i32 %110, 4
  %159 = add i32 %78, %158
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %160
  %162 = load float, float addrspace(4)* %161, align 4, !tbaa !17
  %163 = add i32 %81, %158
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %164
  %166 = load i8, i8 addrspace(1)* %165, align 1, !tbaa !21, !amdgpu.noclobber !5
  %167 = uitofp i8 %166 to float
  %168 = fmul contract float %162, %167
  %169 = fadd contract float %157, %168
  %170 = add i32 %110, 5
  %171 = add i32 %78, %170
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %172
  %174 = load float, float addrspace(4)* %173, align 4, !tbaa !17
  %175 = add i32 %81, %170
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %176
  %178 = load i8, i8 addrspace(1)* %177, align 1, !tbaa !21, !amdgpu.noclobber !5
  %179 = uitofp i8 %178 to float
  %180 = fmul contract float %174, %179
  %181 = fadd contract float %169, %180
  %182 = add i32 %110, 6
  %183 = add i32 %78, %182
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %184
  %186 = load float, float addrspace(4)* %185, align 4, !tbaa !17
  %187 = add i32 %81, %182
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %188
  %190 = load i8, i8 addrspace(1)* %189, align 1, !tbaa !21, !amdgpu.noclobber !5
  %191 = uitofp i8 %190 to float
  %192 = fmul contract float %186, %191
  %193 = fadd contract float %181, %192
  %194 = add i32 %110, 7
  %195 = add i32 %78, %194
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds [256 x float], [256 x float] addrspace(4)* @mask, i64 0, i64 %196
  %198 = load float, float addrspace(4)* %197, align 4, !tbaa !17
  %199 = add i32 %81, %194
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %200
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !21, !amdgpu.noclobber !5
  %203 = uitofp i8 %202 to float
  %204 = fmul contract float %198, %203
  %205 = fadd contract float %193, %204
  %206 = add i32 %110, 8
  %207 = icmp eq i32 %194, %65
  br i1 %207, label %104, label %108, !llvm.loop !26

208:                                              ; preds = %104, %49, %40, %9
  %209 = phi float [ 0.000000e+00, %49 ], [ 0.000000e+00, %40 ], [ 0.000000e+00, %9 ], [ %105, %104 ]
  %210 = fptoui float %209 to i8
  %211 = mul nsw i32 %32, %1
  %212 = add nsw i32 %211, %21
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %213
  store i8 %210, i8 addrspace(1)* %214, align 1, !tbaa !21
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
