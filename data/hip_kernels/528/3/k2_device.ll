; ModuleID = '../data/hip_kernels/528/3/main.cu'
source_filename = "../data/hip_kernels/528/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z2k2iPbPiS_S_(i32 %0, i8 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i8 addrspace(1)* nocapture %3, i8 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %7, label %35

7:                                                ; preds = %5
  %8 = and i32 %0, 3
  %9 = icmp ult i32 %0, 4
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = and i32 %0, -4
  br label %44

12:                                               ; preds = %93, %7
  %13 = phi i32 [ undef, %7 ], [ %94, %93 ]
  %14 = phi i32 [ 0, %7 ], [ %95, %93 ]
  %15 = phi i32 [ 0, %7 ], [ %94, %93 ]
  %16 = icmp eq i32 %8, 0
  br i1 %16, label %35, label %17

17:                                               ; preds = %12, %30
  %18 = phi i32 [ %32, %30 ], [ %14, %12 ]
  %19 = phi i32 [ %31, %30 ], [ %15, %12 ]
  %20 = phi i32 [ %33, %30 ], [ 0, %12 ]
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %21
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !4, !range !8
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %30, label %25

25:                                               ; preds = %17
  store i8 0, i8 addrspace(1)* %22, align 1, !tbaa !4
  %26 = add nsw i32 %19, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  store i32 %18, i32 addrspace(1)* %28, align 4, !tbaa !9
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %21
  store i8 1, i8 addrspace(1)* %29, align 1, !tbaa !4
  br label %30

30:                                               ; preds = %25, %17
  %31 = phi i32 [ %26, %25 ], [ %19, %17 ]
  %32 = add nuw nsw i32 %18, 1
  %33 = add i32 %20, 1
  %34 = icmp eq i32 %33, %8
  br i1 %34, label %35, label %17, !llvm.loop !11

35:                                               ; preds = %12, %30, %5
  %36 = phi i32 [ 0, %5 ], [ %13, %12 ], [ %31, %30 ]
  store i32 %36, i32 addrspace(1)* %2, align 4, !tbaa !9
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %113

38:                                               ; preds = %35
  %39 = add nsw i32 %0, -1
  %40 = and i32 %36, 7
  %41 = icmp ult i32 %36, 8
  br i1 %41, label %98, label %42

42:                                               ; preds = %38
  %43 = and i32 %36, -8
  br label %114

44:                                               ; preds = %93, %10
  %45 = phi i32 [ 0, %10 ], [ %95, %93 ]
  %46 = phi i32 [ 0, %10 ], [ %94, %93 ]
  %47 = phi i32 [ 0, %10 ], [ %96, %93 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %48
  %50 = load i8, i8 addrspace(1)* %49, align 1, !tbaa !4, !range !8
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %57, label %52

52:                                               ; preds = %44
  store i8 0, i8 addrspace(1)* %49, align 1, !tbaa !4
  %53 = add nsw i32 %46, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  store i32 %45, i32 addrspace(1)* %55, align 4, !tbaa !9
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %48
  store i8 1, i8 addrspace(1)* %56, align 1, !tbaa !4
  br label %57

57:                                               ; preds = %44, %52
  %58 = phi i32 [ %53, %52 ], [ %46, %44 ]
  %59 = or i32 %45, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %60
  %62 = load i8, i8 addrspace(1)* %61, align 1, !tbaa !4, !range !8
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %69, label %64

64:                                               ; preds = %57
  store i8 0, i8 addrspace(1)* %61, align 1, !tbaa !4
  %65 = add nsw i32 %58, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  store i32 %59, i32 addrspace(1)* %67, align 4, !tbaa !9
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %60
  store i8 1, i8 addrspace(1)* %68, align 1, !tbaa !4
  br label %69

69:                                               ; preds = %64, %57
  %70 = phi i32 [ %65, %64 ], [ %58, %57 ]
  %71 = or i32 %45, 2
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %72
  %74 = load i8, i8 addrspace(1)* %73, align 1, !tbaa !4, !range !8
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %81, label %76

76:                                               ; preds = %69
  store i8 0, i8 addrspace(1)* %73, align 1, !tbaa !4
  %77 = add nsw i32 %70, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %78
  store i32 %71, i32 addrspace(1)* %79, align 4, !tbaa !9
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %72
  store i8 1, i8 addrspace(1)* %80, align 1, !tbaa !4
  br label %81

81:                                               ; preds = %76, %69
  %82 = phi i32 [ %77, %76 ], [ %70, %69 ]
  %83 = or i32 %45, 3
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !4, !range !8
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %93, label %88

88:                                               ; preds = %81
  store i8 0, i8 addrspace(1)* %85, align 1, !tbaa !4
  %89 = add nsw i32 %82, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %90
  store i32 %83, i32 addrspace(1)* %91, align 4, !tbaa !9
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %84
  store i8 1, i8 addrspace(1)* %92, align 1, !tbaa !4
  br label %93

93:                                               ; preds = %88, %81
  %94 = phi i32 [ %89, %88 ], [ %82, %81 ]
  %95 = add nuw nsw i32 %45, 4
  %96 = add i32 %47, 4
  %97 = icmp eq i32 %96, %11
  br i1 %97, label %12, label %44, !llvm.loop !13

98:                                               ; preds = %172, %38
  %99 = phi i32 [ 0, %38 ], [ %166, %172 ]
  %100 = icmp eq i32 %40, 0
  br i1 %100, label %113, label %101

101:                                              ; preds = %98, %110
  %102 = phi i32 [ %104, %110 ], [ %99, %98 ]
  %103 = phi i32 [ %111, %110 ], [ 0, %98 ]
  %104 = add nuw nsw i32 %102, 1
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !9
  %108 = icmp eq i32 %107, %39
  br i1 %108, label %109, label %110

109:                                              ; preds = %101
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %110

110:                                              ; preds = %109, %101
  %111 = add i32 %103, 1
  %112 = icmp eq i32 %111, %40
  br i1 %112, label %113, label %101, !llvm.loop !15

113:                                              ; preds = %98, %110, %35
  ret void

114:                                              ; preds = %172, %42
  %115 = phi i32 [ 0, %42 ], [ %166, %172 ]
  %116 = phi i32 [ 0, %42 ], [ %173, %172 ]
  %117 = or i32 %115, 1
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !9
  %121 = icmp eq i32 %120, %39
  br i1 %121, label %122, label %123

122:                                              ; preds = %114
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %123

123:                                              ; preds = %114, %122
  %124 = or i32 %115, 2
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !9
  %128 = icmp eq i32 %127, %39
  br i1 %128, label %129, label %130

129:                                              ; preds = %123
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %130

130:                                              ; preds = %129, %123
  %131 = or i32 %115, 3
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %132
  %134 = load i32, i32 addrspace(1)* %133, align 4, !tbaa !9
  %135 = icmp eq i32 %134, %39
  br i1 %135, label %136, label %137

136:                                              ; preds = %130
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %137

137:                                              ; preds = %136, %130
  %138 = or i32 %115, 4
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %139
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !9
  %142 = icmp eq i32 %141, %39
  br i1 %142, label %143, label %144

143:                                              ; preds = %137
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %144

144:                                              ; preds = %143, %137
  %145 = or i32 %115, 5
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !9
  %149 = icmp eq i32 %148, %39
  br i1 %149, label %150, label %151

150:                                              ; preds = %144
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %151

151:                                              ; preds = %150, %144
  %152 = or i32 %115, 6
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !9
  %156 = icmp eq i32 %155, %39
  br i1 %156, label %157, label %158

157:                                              ; preds = %151
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %158

158:                                              ; preds = %157, %151
  %159 = or i32 %115, 7
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %160
  %162 = load i32, i32 addrspace(1)* %161, align 4, !tbaa !9
  %163 = icmp eq i32 %162, %39
  br i1 %163, label %164, label %165

164:                                              ; preds = %158
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %165

165:                                              ; preds = %164, %158
  %166 = add nuw nsw i32 %115, 8
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %167
  %169 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !9
  %170 = icmp eq i32 %169, %39
  br i1 %170, label %171, label %172

171:                                              ; preds = %165
  store i8 1, i8 addrspace(1)* %4, align 1, !tbaa !4
  br label %172

172:                                              ; preds = %171, %165
  %173 = add i32 %116, 8
  %174 = icmp eq i32 %173, %43
  br i1 %174, label %98, label %114, !llvm.loop !16
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
!5 = !{!"bool", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i8 0, i8 2}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
