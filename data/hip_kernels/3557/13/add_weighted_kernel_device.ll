; ModuleID = '../data/hip_kernels/3557/13/main.cu'
source_filename = "../data/hip_kernels/3557/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZL6colors = internal unnamed_addr addrspace(4) constant [4 x [3 x float]] [[3 x float] [float 2.550000e+02, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 0.000000e+00, float 2.550000e+02, float 0.000000e+00], [3 x float] [float 0.000000e+00, float 0.000000e+00, float 2.550000e+02], [3 x float] zeroinitializer], align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19add_weighted_kerneljjjjPfjjjS_Phf(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, i8 addrspace(1)* nocapture writeonly %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %13 = mul i32 %3, %2
  %14 = mul i32 %13, %12
  %15 = mul i32 %14, %1
  %16 = mul i32 %7, %6
  %17 = mul i32 %16, %12
  %18 = mul i32 %17, %5
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !6
  %28 = mul i32 %19, %24
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = add i32 %28, %29
  %31 = udiv i32 %27, %24
  %32 = mul i32 %31, %24
  %33 = icmp ugt i32 %27, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %24
  %37 = icmp ult i32 %30, %13
  br i1 %37, label %38, label %47

38:                                               ; preds = %11
  %39 = icmp ugt i32 %1, 1
  %40 = shl i32 %16, 1
  %41 = add i32 %1, -1
  %42 = add i32 %1, -2
  %43 = and i32 %41, 7
  %44 = icmp ult i32 %42, 7
  %45 = and i32 %41, -8
  %46 = icmp eq i32 %43, 0
  br label %48

47:                                               ; preds = %208, %11
  ret void

48:                                               ; preds = %38, %208
  %49 = phi i32 [ %30, %38 ], [ %209, %208 ]
  br i1 %39, label %50, label %208

50:                                               ; preds = %48
  %51 = add i32 %49, %15
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  br i1 %44, label %55, label %129

55:                                               ; preds = %129, %50
  %56 = phi i32 [ undef, %50 ], [ %204, %129 ]
  %57 = phi i32 [ 0, %50 ], [ %204, %129 ]
  %58 = phi float [ %54, %50 ], [ %203, %129 ]
  %59 = phi i32 [ 1, %50 ], [ %205, %129 ]
  br i1 %46, label %76, label %60

60:                                               ; preds = %55, %60
  %61 = phi i32 [ %72, %60 ], [ %57, %55 ]
  %62 = phi float [ %71, %60 ], [ %58, %55 ]
  %63 = phi i32 [ %73, %60 ], [ %59, %55 ]
  %64 = phi i32 [ %74, %60 ], [ 0, %55 ]
  %65 = mul i32 %13, %63
  %66 = add i32 %51, %65
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %4, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fcmp contract ogt float %69, %62
  %71 = select i1 %70, float %69, float %62
  %72 = select i1 %70, i32 %63, i32 %61
  %73 = add nuw i32 %63, 1
  %74 = add i32 %64, 1
  %75 = icmp eq i32 %74, %43
  br i1 %75, label %76, label %60, !llvm.loop !20

76:                                               ; preds = %60, %55
  %77 = phi i32 [ %56, %55 ], [ %72, %60 ]
  %78 = and i32 %77, 3
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]] addrspace(4)* @_ZL6colors, i64 0, i64 %79, i64 0
  %81 = load float, float addrspace(4)* %80, align 4, !tbaa !16
  %82 = fmul contract float %81, %10
  %83 = add i32 %49, %18
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %8, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fadd contract float %82, %86
  %88 = fpext float %87 to double
  %89 = tail call double @llvm.minnum.f64(double %88, double 2.550000e+02)
  %90 = fpext float %82 to double
  %91 = tail call double @llvm.maxnum.f64(double %90, double %89)
  %92 = fptoui double %91 to i8
  %93 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]] addrspace(4)* @_ZL6colors, i64 0, i64 %79, i64 1
  %94 = load float, float addrspace(4)* %93, align 4, !tbaa !16
  %95 = fmul contract float %94, %10
  %96 = add i32 %83, %16
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %8, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = fadd contract float %95, %99
  %101 = fpext float %100 to double
  %102 = tail call double @llvm.minnum.f64(double %101, double 2.550000e+02)
  %103 = fpext float %95 to double
  %104 = tail call double @llvm.maxnum.f64(double %103, double %102)
  %105 = fptoui double %104 to i8
  %106 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]] addrspace(4)* @_ZL6colors, i64 0, i64 %79, i64 2
  %107 = load float, float addrspace(4)* %106, align 4, !tbaa !16
  %108 = fmul contract float %107, %10
  %109 = add i32 %83, %40
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %8, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fadd contract float %108, %112
  %114 = fpext float %113 to double
  %115 = tail call double @llvm.minnum.f64(double %114, double 2.550000e+02)
  %116 = fpext float %108 to double
  %117 = tail call double @llvm.maxnum.f64(double %116, double %115)
  %118 = fptoui double %117 to i8
  %119 = mul i32 %49, 3
  %120 = add i32 %119, %18
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %121
  store i8 %92, i8 addrspace(1)* %122, align 1, !tbaa !22
  %123 = add i32 %120, 1
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %124
  store i8 %105, i8 addrspace(1)* %125, align 1, !tbaa !22
  %126 = add i32 %120, 2
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %127
  store i8 %118, i8 addrspace(1)* %128, align 1, !tbaa !22
  br label %208

129:                                              ; preds = %50, %129
  %130 = phi i32 [ %204, %129 ], [ 0, %50 ]
  %131 = phi float [ %203, %129 ], [ %54, %50 ]
  %132 = phi i32 [ %205, %129 ], [ 1, %50 ]
  %133 = phi i32 [ %206, %129 ], [ 0, %50 ]
  %134 = mul i32 %13, %132
  %135 = add i32 %51, %134
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %4, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = fcmp contract ogt float %138, %131
  %140 = select i1 %139, float %138, float %131
  %141 = select i1 %139, i32 %132, i32 %130
  %142 = add nuw nsw i32 %132, 1
  %143 = mul i32 %13, %142
  %144 = add i32 %51, %143
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %4, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16
  %148 = fcmp contract ogt float %147, %140
  %149 = select i1 %148, float %147, float %140
  %150 = select i1 %148, i32 %142, i32 %141
  %151 = add nuw nsw i32 %132, 2
  %152 = mul i32 %13, %151
  %153 = add i32 %51, %152
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %4, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = fcmp contract ogt float %156, %149
  %158 = select i1 %157, float %156, float %149
  %159 = select i1 %157, i32 %151, i32 %150
  %160 = add nuw nsw i32 %132, 3
  %161 = mul i32 %13, %160
  %162 = add i32 %51, %161
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %4, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !16
  %166 = fcmp contract ogt float %165, %158
  %167 = select i1 %166, float %165, float %158
  %168 = select i1 %166, i32 %160, i32 %159
  %169 = add nuw nsw i32 %132, 4
  %170 = mul i32 %13, %169
  %171 = add i32 %51, %170
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %4, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = fcmp contract ogt float %174, %167
  %176 = select i1 %175, float %174, float %167
  %177 = select i1 %175, i32 %169, i32 %168
  %178 = add nuw nsw i32 %132, 5
  %179 = mul i32 %13, %178
  %180 = add i32 %51, %179
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %4, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !16
  %184 = fcmp contract ogt float %183, %176
  %185 = select i1 %184, float %183, float %176
  %186 = select i1 %184, i32 %178, i32 %177
  %187 = add nuw nsw i32 %132, 6
  %188 = mul i32 %13, %187
  %189 = add i32 %51, %188
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %4, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !16
  %193 = fcmp contract ogt float %192, %185
  %194 = select i1 %193, float %192, float %185
  %195 = select i1 %193, i32 %187, i32 %186
  %196 = add nuw i32 %132, 7
  %197 = mul i32 %13, %196
  %198 = add i32 %51, %197
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %4, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !16
  %202 = fcmp contract ogt float %201, %194
  %203 = select i1 %202, float %201, float %194
  %204 = select i1 %202, i32 %196, i32 %195
  %205 = add nuw i32 %132, 8
  %206 = add i32 %133, 8
  %207 = icmp eq i32 %206, %45
  br i1 %207, label %55, label %129, !llvm.loop !23

208:                                              ; preds = %76, %48
  %209 = add i32 %49, %36
  %210 = icmp ult i32 %209, %13
  br i1 %210, label %48, label %47, !llvm.loop !25
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = !{!18, !18, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !24}
