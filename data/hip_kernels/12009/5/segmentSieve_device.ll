; ModuleID = '../data/hip_kernels/12009/5/main.cu'
source_filename = "../data/hip_kernels/12009/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL12segmentSievePcm = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL12segmentSievePcm(i8 addrspace(1)* nocapture %0, i64 %1) local_unnamed_addr #0 comdat {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %176

13:                                               ; preds = %2
  %14 = uitofp i64 %1 to double
  %15 = icmp eq i64 %1, 0
  %16 = select i1 %15, double 0x4FF0000000000000, double 1.000000e+00
  %17 = fmul double %16, %14
  %18 = tail call double @llvm.amdgcn.rsq.f64(double %17)
  %19 = fmul double %17, %18
  %20 = fmul double %18, 5.000000e-01
  %21 = fneg double %20
  %22 = tail call double @llvm.fma.f64(double %21, double %19, double 5.000000e-01)
  %23 = tail call double @llvm.fma.f64(double %20, double %22, double %20)
  %24 = tail call double @llvm.fma.f64(double %19, double %22, double %19)
  %25 = fneg double %24
  %26 = tail call double @llvm.fma.f64(double %25, double %24, double %17)
  %27 = tail call double @llvm.fma.f64(double %26, double %23, double %24)
  %28 = fneg double %27
  %29 = tail call double @llvm.fma.f64(double %28, double %27, double %17)
  %30 = tail call double @llvm.fma.f64(double %29, double %23, double %27)
  %31 = select i1 %15, double 0x37F0000000000000, double 1.000000e+00
  %32 = fmul double %31, %30
  %33 = fcmp oeq double %17, 0.000000e+00
  %34 = fcmp oeq double %17, 0x7FF0000000000000
  %35 = or i1 %33, %34
  %36 = select i1 %35, double %17, double %32
  %37 = fptoui double %36 to i64
  %38 = trunc i64 %37 to i32
  %39 = mul i32 %11, %38
  %40 = freeze i32 %39
  %41 = add i32 %40, %38
  %42 = sext i32 %41 to i64
  %43 = icmp ugt i64 %42, %1
  %44 = trunc i64 %1 to i32
  %45 = select i1 %43, i32 %44, i32 %41
  %46 = icmp ugt i64 %37, 2
  br i1 %46, label %47, label %176

47:                                               ; preds = %13, %172
  %48 = phi i64 [ %174, %172 ], [ 2, %13 ]
  %49 = trunc i64 %48 to i32
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %48
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %53, label %172

53:                                               ; preds = %47
  %54 = srem i32 %40, %49
  %55 = sub nsw i32 %40, %54
  %56 = icmp sgt i32 %54, 0
  %57 = select i1 %56, i32 %49, i32 0
  %58 = add nsw i32 %55, %57
  %59 = icmp slt i32 %58, %45
  br i1 %59, label %60, label %172

60:                                               ; preds = %53
  %61 = add i32 %40, %57
  %62 = add i32 %61, %49
  %63 = sub i32 %62, %54
  %64 = tail call i32 @llvm.smax.i32(i32 %45, i32 %63)
  %65 = add i32 %54, %64
  %66 = add i32 %40, %57
  %67 = add i32 %66, %49
  %68 = icmp ne i32 %65, %67
  %69 = sext i1 %68 to i32
  %70 = select i1 %68, i32 2, i32 1
  %71 = add i32 %54, %64
  %72 = add i32 %40, %57
  %73 = add i32 %71, %69
  %74 = add i32 %72, %49
  %75 = sub i32 %73, %74
  %76 = udiv i32 %75, %49
  %77 = add i32 %70, %76
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %164, label %79

79:                                               ; preds = %60
  %80 = and i32 %77, -4
  %81 = mul i32 %80, %49
  %82 = add i32 %58, %81
  %83 = insertelement <4 x i32> poison, i32 %58, i64 0
  %84 = shufflevector <4 x i32> %83, <4 x i32> poison, <4 x i32> zeroinitializer
  %85 = insertelement <4 x i32> poison, i32 %49, i64 0
  %86 = shufflevector <4 x i32> %85, <4 x i32> poison, <4 x i32> zeroinitializer
  %87 = mul <4 x i32> %86, <i32 0, i32 1, i32 2, i32 3>
  %88 = add <4 x i32> %84, %87
  %89 = shl i32 %49, 2
  %90 = insertelement <4 x i32> poison, i32 %89, i64 0
  %91 = shufflevector <4 x i32> %90, <4 x i32> poison, <4 x i32> zeroinitializer
  %92 = add i32 %77, -4
  %93 = lshr i32 %92, 2
  %94 = add nuw nsw i32 %93, 1
  %95 = and i32 %94, 3
  %96 = icmp ult i32 %92, 12
  br i1 %96, label %144, label %97

97:                                               ; preds = %79
  %98 = and i32 %94, -4
  br label %99

99:                                               ; preds = %99, %97
  %100 = phi <4 x i32> [ %88, %97 ], [ %141, %99 ]
  %101 = phi i32 [ 0, %97 ], [ %142, %99 ]
  %102 = sext <4 x i32> %100 to <4 x i64>
  %103 = extractelement <4 x i64> %102, i64 0
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %103
  %105 = extractelement <4 x i64> %102, i64 1
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = extractelement <4 x i64> %102, i64 2
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  %109 = extractelement <4 x i64> %102, i64 3
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %109
  store i8 1, i8 addrspace(1)* %104, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %106, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %108, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %110, align 1, !tbaa !7
  %111 = add <4 x i32> %100, %91
  %112 = sext <4 x i32> %111 to <4 x i64>
  %113 = extractelement <4 x i64> %112, i64 0
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %113
  %115 = extractelement <4 x i64> %112, i64 1
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %115
  %117 = extractelement <4 x i64> %112, i64 2
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = extractelement <4 x i64> %112, i64 3
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %119
  store i8 1, i8 addrspace(1)* %114, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %116, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %118, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %120, align 1, !tbaa !7
  %121 = add <4 x i32> %111, %91
  %122 = sext <4 x i32> %121 to <4 x i64>
  %123 = extractelement <4 x i64> %122, i64 0
  %124 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %123
  %125 = extractelement <4 x i64> %122, i64 1
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %125
  %127 = extractelement <4 x i64> %122, i64 2
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %127
  %129 = extractelement <4 x i64> %122, i64 3
  %130 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %129
  store i8 1, i8 addrspace(1)* %124, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %126, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %128, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %130, align 1, !tbaa !7
  %131 = add <4 x i32> %121, %91
  %132 = sext <4 x i32> %131 to <4 x i64>
  %133 = extractelement <4 x i64> %132, i64 0
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %133
  %135 = extractelement <4 x i64> %132, i64 1
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %135
  %137 = extractelement <4 x i64> %132, i64 2
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %137
  %139 = extractelement <4 x i64> %132, i64 3
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %139
  store i8 1, i8 addrspace(1)* %134, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %136, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %138, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %140, align 1, !tbaa !7
  %141 = add <4 x i32> %131, %91
  %142 = add nuw i32 %101, 4
  %143 = icmp eq i32 %142, %98
  br i1 %143, label %144, label %99, !llvm.loop !10

144:                                              ; preds = %99, %79
  %145 = phi <4 x i32> [ %88, %79 ], [ %141, %99 ]
  %146 = icmp eq i32 %95, 0
  br i1 %146, label %162, label %147

147:                                              ; preds = %144, %147
  %148 = phi <4 x i32> [ %159, %147 ], [ %145, %144 ]
  %149 = phi i32 [ %160, %147 ], [ 0, %144 ]
  %150 = sext <4 x i32> %148 to <4 x i64>
  %151 = extractelement <4 x i64> %150, i64 0
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %151
  %153 = extractelement <4 x i64> %150, i64 1
  %154 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %153
  %155 = extractelement <4 x i64> %150, i64 2
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %155
  %157 = extractelement <4 x i64> %150, i64 3
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %157
  store i8 1, i8 addrspace(1)* %152, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %154, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %156, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %158, align 1, !tbaa !7
  %159 = add <4 x i32> %148, %91
  %160 = add i32 %149, 1
  %161 = icmp eq i32 %160, %95
  br i1 %161, label %162, label %147, !llvm.loop !13

162:                                              ; preds = %147, %144
  %163 = icmp eq i32 %77, %80
  br i1 %163, label %172, label %164

164:                                              ; preds = %60, %162
  %165 = phi i32 [ %58, %60 ], [ %82, %162 ]
  br label %166

166:                                              ; preds = %164, %166
  %167 = phi i32 [ %170, %166 ], [ %165, %164 ]
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %168
  store i8 1, i8 addrspace(1)* %169, align 1, !tbaa !7
  %170 = add nsw i32 %167, %49
  %171 = icmp slt i32 %170, %45
  br i1 %171, label %166, label %172, !llvm.loop !15

172:                                              ; preds = %166, %162, %53, %47
  %173 = add nuw nsw i64 %48, 1
  %174 = and i64 %173, 4294967295
  %175 = icmp ult i64 %174, %37
  br i1 %175, label %47, label %176, !llvm.loop !17

176:                                              ; preds = %172, %13, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !11, !16, !12}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !11}
