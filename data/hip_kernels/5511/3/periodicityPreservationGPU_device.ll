; ModuleID = '../data/hip_kernels/5511/3/main.cu'
source_filename = "../data/hip_kernels/5511/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26periodicityPreservationGPUiPc(i32 %0, i8 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = icmp slt i32 %0, 1
  br i1 %3, label %35, label %4

4:                                                ; preds = %2
  %5 = add nuw nsw i32 %0, 2
  %6 = add nuw nsw i32 %0, 1
  %7 = mul nsw i32 %5, %6
  %8 = mul nsw i32 %5, %0
  %9 = and i32 %0, 3
  %10 = icmp ult i32 %0, 4
  br i1 %10, label %13, label %11

11:                                               ; preds = %4
  %12 = and i32 %0, -4
  br label %44

13:                                               ; preds = %44, %4
  %14 = phi i32 [ 1, %4 ], [ %102, %44 ]
  %15 = icmp eq i32 %9, 0
  br i1 %15, label %35, label %16

16:                                               ; preds = %13, %16
  %17 = phi i32 [ %32, %16 ], [ %14, %13 ]
  %18 = phi i32 [ %33, %16 ], [ 0, %13 ]
  %19 = add nsw i32 %17, %5
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !4
  %23 = add nsw i32 %17, %7
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %24
  store i8 %22, i8 addrspace(1)* %25, align 1, !tbaa !4
  %26 = add nsw i32 %17, %8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !4
  %30 = zext i32 %17 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %30
  store i8 %29, i8 addrspace(1)* %31, align 1, !tbaa !4
  %32 = add nuw i32 %17, 1
  %33 = add i32 %18, 1
  %34 = icmp eq i32 %33, %9
  br i1 %34, label %35, label %16, !llvm.loop !7

35:                                               ; preds = %13, %16, %2
  %36 = icmp slt i32 %0, -1
  br i1 %36, label %193, label %37

37:                                               ; preds = %35
  %38 = add nsw i32 %0, 2
  %39 = add i32 %0, 1
  %40 = and i32 %38, 3
  %41 = icmp ult i32 %39, 3
  br i1 %41, label %170, label %42

42:                                               ; preds = %37
  %43 = and i32 %38, -4
  br label %105

44:                                               ; preds = %44, %11
  %45 = phi i32 [ 1, %11 ], [ %102, %44 ]
  %46 = phi i32 [ 0, %11 ], [ %103, %44 ]
  %47 = add nsw i32 %45, %5
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !4
  %51 = add nsw i32 %45, %7
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %52
  store i8 %50, i8 addrspace(1)* %53, align 1, !tbaa !4
  %54 = add nsw i32 %45, %8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !4
  %58 = zext i32 %45 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %58
  store i8 %57, i8 addrspace(1)* %59, align 1, !tbaa !4
  %60 = add nuw nsw i32 %45, 1
  %61 = add nsw i32 %60, %5
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %62
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !4
  %65 = add nsw i32 %60, %7
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %66
  store i8 %64, i8 addrspace(1)* %67, align 1, !tbaa !4
  %68 = add nsw i32 %60, %8
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !4
  %72 = zext i32 %60 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %72
  store i8 %71, i8 addrspace(1)* %73, align 1, !tbaa !4
  %74 = add nuw nsw i32 %45, 2
  %75 = add nsw i32 %74, %5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !4
  %79 = add nsw i32 %74, %7
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %80
  store i8 %78, i8 addrspace(1)* %81, align 1, !tbaa !4
  %82 = add nsw i32 %74, %8
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !4
  %86 = zext i32 %74 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %86
  store i8 %85, i8 addrspace(1)* %87, align 1, !tbaa !4
  %88 = add nuw i32 %45, 3
  %89 = add nsw i32 %88, %5
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !4
  %93 = add nsw i32 %88, %7
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %94
  store i8 %92, i8 addrspace(1)* %95, align 1, !tbaa !4
  %96 = add nsw i32 %88, %8
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %97
  %99 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !4
  %100 = zext i32 %88 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %100
  store i8 %99, i8 addrspace(1)* %101, align 1, !tbaa !4
  %102 = add nuw i32 %45, 4
  %103 = add i32 %46, 4
  %104 = icmp eq i32 %103, %12
  br i1 %104, label %13, label %44, !llvm.loop !9

105:                                              ; preds = %105, %42
  %106 = phi i32 [ 0, %42 ], [ %167, %105 ]
  %107 = phi i32 [ 0, %42 ], [ %168, %105 ]
  %108 = mul nsw i32 %106, %38
  %109 = or i32 %108, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %110
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !4
  %113 = add nsw i32 %108, %0
  %114 = add nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %115
  store i8 %112, i8 addrspace(1)* %116, align 1, !tbaa !4
  %117 = sext i32 %113 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !4
  %120 = sext i32 %108 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %120
  store i8 %119, i8 addrspace(1)* %121, align 1, !tbaa !4
  %122 = or i32 %106, 1
  %123 = mul nsw i32 %122, %38
  %124 = add nsw i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !4
  %128 = add nsw i32 %123, %0
  %129 = add nsw i32 %128, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %130
  store i8 %127, i8 addrspace(1)* %131, align 1, !tbaa !4
  %132 = sext i32 %128 to i64
  %133 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %132
  %134 = load i8, i8 addrspace(1)* %133, align 1, !tbaa !4
  %135 = sext i32 %123 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %135
  store i8 %134, i8 addrspace(1)* %136, align 1, !tbaa !4
  %137 = or i32 %106, 2
  %138 = mul nsw i32 %137, %38
  %139 = or i32 %138, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %140
  %142 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !4
  %143 = add nsw i32 %138, %0
  %144 = add nsw i32 %143, 1
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %145
  store i8 %142, i8 addrspace(1)* %146, align 1, !tbaa !4
  %147 = sext i32 %143 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %147
  %149 = load i8, i8 addrspace(1)* %148, align 1, !tbaa !4
  %150 = sext i32 %138 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %150
  store i8 %149, i8 addrspace(1)* %151, align 1, !tbaa !4
  %152 = or i32 %106, 3
  %153 = mul nsw i32 %152, %38
  %154 = add nsw i32 %153, 1
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %155
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !4
  %158 = add nsw i32 %153, %0
  %159 = add nsw i32 %158, 1
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %160
  store i8 %157, i8 addrspace(1)* %161, align 1, !tbaa !4
  %162 = sext i32 %158 to i64
  %163 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %162
  %164 = load i8, i8 addrspace(1)* %163, align 1, !tbaa !4
  %165 = sext i32 %153 to i64
  %166 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %165
  store i8 %164, i8 addrspace(1)* %166, align 1, !tbaa !4
  %167 = add nuw i32 %106, 4
  %168 = add i32 %107, 4
  %169 = icmp eq i32 %168, %43
  br i1 %169, label %170, label %105, !llvm.loop !11

170:                                              ; preds = %105, %37
  %171 = phi i32 [ 0, %37 ], [ %167, %105 ]
  %172 = icmp eq i32 %40, 0
  br i1 %172, label %193, label %173

173:                                              ; preds = %170, %173
  %174 = phi i32 [ %190, %173 ], [ %171, %170 ]
  %175 = phi i32 [ %191, %173 ], [ 0, %170 ]
  %176 = mul nsw i32 %174, %38
  %177 = add nsw i32 %176, 1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %178
  %180 = load i8, i8 addrspace(1)* %179, align 1, !tbaa !4
  %181 = add nsw i32 %176, %0
  %182 = add nsw i32 %181, 1
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %183
  store i8 %180, i8 addrspace(1)* %184, align 1, !tbaa !4
  %185 = sext i32 %181 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %185
  %187 = load i8, i8 addrspace(1)* %186, align 1, !tbaa !4
  %188 = sext i32 %176 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %188
  store i8 %187, i8 addrspace(1)* %189, align 1, !tbaa !4
  %190 = add nuw i32 %174, 1
  %191 = add i32 %175, 1
  %192 = icmp eq i32 %191, %40
  br i1 %192, label %193, label %173, !llvm.loop !12

193:                                              ; preds = %170, %173, %35
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !8}
